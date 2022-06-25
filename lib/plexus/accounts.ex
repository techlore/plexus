defmodule Plexus.Accounts do
  alias Plexus.Repo
  alias Plexus.Schemas.User
  alias Plexus.Schemas.UserToken

  @spec get_user!(Ecto.UUID.t()) :: User.t()
  def get_user!(id), do: Repo.get!(User, id)

  @spec get_user_by_session_token(binary()) :: User.t() | nil
  def get_user_by_session_token(token) do
    {:ok, query} = UserToken.verify_session_token_query(token)
    Repo.one(query)
  end

  @spec get_user_by_username_and_password(String.t(), String.t()) :: User.t() | nil
  def get_user_by_username_and_password(username, password)
      when is_binary(username) and is_binary(password) do
    user = Repo.get_by(User, username: username)
    if User.valid_password?(user, password), do: user
  end

  @spec register_user(%{username: String.t(), password: String.t(), role: atom()}) ::
          {:ok, User.t()} | {:error, Ecto.Changeset.t()}
  def register_user(attrs) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end

  @spec generate_user_session_token(User.t()) :: binary()
  def generate_user_session_token(user) do
    {token, user_token} = UserToken.build_session_token(user)
    Repo.insert!(user_token)
    token
  end

  @spec delete_session_token(binary()) :: :ok
  def delete_session_token(token) do
    Repo.delete_all(UserToken.token_and_context_query(token, "session"))
    :ok
  end
end
