defmodule Plexus.DeviceEmail do
  import Swoosh.Email

  @from_name "Plexus"
  @from_email "noreply@techlore.tech"

  @spec registration(%{email: String.t(), code: String.t()}) :: Swoosh.Email.t()
  def registration(%{email: email, code: code}) do
    new()
    |> to(email)
    |> from({@from_name, @from_email})
    |> subject("Plexus One Time Passcode")
    |> html_body("<h1>#{code}</h1>")
    |> text_body("#{code}\n")
  end
end
