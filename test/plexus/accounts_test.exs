defmodule Plexus.AccountsTest do
  use Plexus.DataCase, async: true

  import Plexus.AccountsFixtures

  alias Plexus.Accounts
  alias Plexus.Schemas.User
  alias Plexus.Schemas.UserToken

  describe "get_user!/1" do
    test "raises if id is invalid" do
      assert_raise Ecto.NoResultsError, fn ->
        user_id = Ecto.UUID.generate()
        Accounts.get_user!(user_id)
      end
    end

    test "returns the user with the given id" do
      %{id: id} = user = user_fixture()
      assert %User{id: ^id} = Accounts.get_user!(user.id)
    end
  end

  describe "get_user_by_username_and_password/2" do
    test "does not return the user if the username does not exist" do
      refute Accounts.get_user_by_username_and_password("unknown_username", "hello world!")
    end

    test "does not return the user if the password is not valid" do
      user = user_fixture()
      refute Accounts.get_user_by_username_and_password(user.username, "invalid")
    end

    test "returns the user if the username and password are valid" do
      %{id: id} = user = user_fixture()

      assert %User{id: ^id} =
               Accounts.get_user_by_username_and_password(user.username, valid_user_password())
    end
  end

  describe "get_user_by_session_token/1" do
    setup do
      user = user_fixture()
      token = Accounts.generate_user_session_token(user)
      %{user: user, token: token}
    end

    test "returns user by token", %{user: user, token: token} do
      assert session_user = Accounts.get_user_by_session_token(token)
      assert session_user.id == user.id
    end

    test "does not return user for invalid token" do
      refute Accounts.get_user_by_session_token("oops")
    end

    test "does not return user for expired token", %{token: token} do
      {1, nil} = Repo.update_all(UserToken, set: [inserted_at: ~N[2020-01-01 00:00:00]])
      refute Accounts.get_user_by_session_token(token)
    end
  end

  describe "register_user/1" do
    test "requires username and password to be set" do
      {:error, changeset} = Accounts.register_user(%{})

      assert %{
               password: ["can't be blank"],
               username: ["can't be blank"],
               role: ["can't be blank"]
             } = errors_on(changeset)
    end

    test "validates username and password and role when given" do
      {:error, changeset} =
        Accounts.register_user(%{username: "t", password: "invalid", role: :intruder})

      assert %{
               username: ["should be at least 3 character(s)"],
               password: [
                 "at least one digit or punctuation character",
                 "at least one upper case character",
                 "should be at least 8 character(s)"
               ],
               role: ["is invalid"]
             } = errors_on(changeset)
    end

    test "validates maximum values for username and password for security" do
      too_long = String.duplicate("db", 100)
      {:error, changeset} = Accounts.register_user(%{username: too_long, password: too_long})
      assert "should be at most 160 character(s)" in errors_on(changeset).username
      assert "should be at most 72 character(s)" in errors_on(changeset).password
    end

    test "validates username uniqueness" do
      %{username: username} = user_fixture()
      {:error, changeset} = Accounts.register_user(%{username: username})
      assert "has already been taken" in errors_on(changeset).username

      # Now try with the upper cased username too, to check that username case is ignored.
      {:error, changeset} = Accounts.register_user(%{username: String.upcase(username)})
      assert "has already been taken" in errors_on(changeset).username
    end

    test "registers users with a hashed password" do
      username = unique_user_username()
      {:ok, user} = Accounts.register_user(valid_user_attributes(username: username))
      assert user.username == username
      assert is_binary(user.hashed_password)
      assert is_nil(user.password)
    end
  end

  describe "delete_session_token/1" do
    test "deletes the token" do
      user = user_fixture()
      token = Accounts.generate_user_session_token(user)
      assert Accounts.delete_session_token(token) == :ok
      refute Accounts.get_user_by_session_token(token)
    end
  end
end
