defmodule PlexusWeb.APIAuthPlug do
  @behaviour Plug

  import Plug.Conn

  @endpoint PlexusWeb.Endpoint
  @salt "device auth"

  @impl Plug
  def init(opts) do
    opts
  end

  @impl Plug
  def call(conn, _opts) do
    with {:ok, token} <- fetch_authorization_token(conn) do
      case Phoenix.Token.verify(@endpoint, @salt, token) do
        {:ok, %{device_id: _device_id, email: _email}} ->
          conn

        {:error, :expired} ->
          conn
          |> send_resp(401, "Token is expired")
          |> halt()

        {:error, :invalid} ->
          conn
          |> send_resp(401, "Invalid token")
          |> halt()

        {:error, :missing} ->
          conn
          |> send_resp(401, "Token is missing")
          |> halt()
      end
    end
  end

  defp fetch_authorization_token(conn) do
    case get_req_header(conn, "authorization") do
      ["Bearer " <> token] ->
        {:ok, token}

      _ ->
        send_resp(conn, 401, "Authorization header is missing")
    end
  end
end
