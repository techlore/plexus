defmodule PlexusWeb.API.V1.DeviceJSON do
  use PlexusWeb, :json

  def register(%{device: device}) do
    %{message: "Passcode sent to #{device.email}"}
  end

  def verify(%{token: token}) when is_binary(token) do
    %{data: %{token: token}}
  end

  def verify(_) do
    %{errors: %{detail: "Invalid or expired passcode"}}
  end
end
