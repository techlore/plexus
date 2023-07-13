defmodule Plexus.AuthServer do
  use GenServer

  require Logger

  defstruct [:device_id, :email, :secret, :start_time_in_seconds]

  @default_timeout :timer.minutes(10)

  @spec start(String.t(), String.t()) :: GenServer.on_start()
  def start(device_id, email) do
    init_args = %{device_id: device_id, email: email}
    name = {:via, Registry, {Registry.Device, device_id}}
    GenServer.start(__MODULE__, init_args, name: name)
  end

  @impl GenServer
  def init(args) do
    state = struct!(__MODULE__, args)
    secret = NimbleTOTP.secret()
    start_time = System.os_time(:second)

    :timer.send_after(@default_timeout, :expire)
    {:ok, %{state | secret: secret, start_time_in_seconds: start_time}}
  end

  @spec build_code(String.t()) :: {:ok, String.t()} | {:error, :not_found}
  def build_code(device_id) do
    with {:ok, pid} <- fetch_device(device_id) do
      GenServer.call(pid, :build_code)
    end
  end

  @spec verify_code(
          String.t(),
          String.t(),
          (device_id :: String.t(), email :: String.t() -> token :: String.t())
        ) :: {:ok, binary()} | {:error, :invalid_code} | {:error, :not_found}
  def verify_code(device_id, code, token_builder_fun) do
    with {:ok, pid} <- fetch_device(device_id) do
      GenServer.call(pid, {:verify, code, token_builder_fun})
    end
  end

  defp fetch_device(device_id) do
    case Registry.lookup(Registry.Device, device_id) do
      [{pid, _}] -> {:ok, pid}
      [] -> {:error, :not_found}
    end
  end

  ## Callbacks

  @impl GenServer
  def handle_call(:build_code, _from, state) do
    default_timeout_in_seconds = div(@default_timeout, 1000)
    time = state.start_time_in_seconds + default_timeout_in_seconds
    code = NimbleTOTP.verification_code(state.secret, time: time)
    {:reply, {:ok, code}, state}
  end

  def handle_call({:verify, code, token_builder_fun}, _from, state) do
    default_timeout_in_seconds = div(@default_timeout, 1000)
    time = state.start_time_in_seconds + default_timeout_in_seconds

    if NimbleTOTP.valid?(state.secret, code, time: time) do
      {:stop, :normal, {:ok, token_builder_fun.(state.device_id, state.email)}, state}
    else
      {:reply, {:error, :invalid_code}, state}
    end
  end

  @impl GenServer
  def handle_info(:expire, state) do
    Logger.info("#{state.email}:#{state.device_id} token expired")
    {:stop, :normal, :expired}
  end
end
