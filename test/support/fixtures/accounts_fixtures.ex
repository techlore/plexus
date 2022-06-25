defmodule Plexus.AccountsFixtures do
  def unique_user_username, do: "user#{System.unique_integer()}"
  def valid_user_password, do: "Hello_w0rld!"

  def valid_user_attributes(attrs \\ %{}) do
    Enum.into(attrs, %{
      username: unique_user_username(),
      password: valid_user_password(),
      role: :developer
    })
  end

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> valid_user_attributes()
      |> Plexus.Accounts.register_user()

    user
  end

  def admin_user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Map.put(:role, :admin)
      |> valid_user_attributes()
      |> Plexus.Accounts.register_user()

    user
  end

  def extract_user_token(fun) do
    {:ok, captured_email} = fun.(&"[TOKEN]#{&1}[TOKEN]")
    [_, token | _] = String.split(captured_email.text_body, "[TOKEN]")
    token
  end
end
