defmodule PlexusWeb.API.V1.DeviceController do
  use PlexusWeb, :controller

  alias Plexus.AuthServer
  alias Plexus.DeviceEmail
  alias Plexus.Mailer
  alias PlexusWeb.Params

  @salt "device auth"

  action_fallback PlexusWeb.FallbackController

  def register(conn, params) do
    schema = %{
      device_id: {:string, required: true},
      email: {:string, required: true}
    }

    with {:ok, params} <- Params.normalize(params, schema),
         {:ok, code} <- build_code(params.device_id, params.email),
         {:ok, _} <- send_registration_email(params.email, code) do
      device = %{id: params.device_id, email: params.email}

      conn
      |> put_status(:created)
      |> render(:register, device: device)
    end
  end

  defp build_code(device_id, email) do
    AuthServer.start(device_id, email)
    AuthServer.build_code(device_id)
  end

  defp send_registration_email(email, code) do
    %{email: email, code: code}
    |> DeviceEmail.registration()
    |> Mailer.deliver()
  end

  def verify(conn, params) do
    schema = %{
      device_id: {:string, required: true},
      code: {:string, required: true}
    }

    with {:ok, params} <- Params.normalize(params, schema) do
      case AuthServer.verify_code(params.device_id, params.code, &token_builder/2) do
        {:ok, token} ->
          conn
          |> put_status(:created)
          |> render(:verify, token: token)

        {:error, _invalid_code_or_not_found} ->
          render(conn, :verify, token: nil)
      end
    end
  end

  defp token_builder(device_id, email) do
    Phoenix.Token.sign(PlexusWeb.Endpoint, @salt, %{device_id: device_id, email: email})
  end
end
