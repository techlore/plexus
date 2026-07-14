defmodule PlexusWeb.SessionController do
  use PlexusWeb, :controller

  def new(conn, _params) do
    render(conn, :new)
  end

  def create(conn, %{"username" => username, "password" => password}) do
    case OneAuth.login(conn, username, password) do
      {:ok, conn} ->
        redirect(conn, to: OneAuth.login_redirect_path(conn))

      :error ->
        conn
        |> put_flash(:error, "Invalid username or password")
        |> redirect(to: OneAuth.login_path(conn))
    end
  end
end
