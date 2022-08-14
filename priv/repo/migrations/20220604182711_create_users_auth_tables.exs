defmodule Plexus.Repo.Migrations.CreateUsersAuthTables do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :citext, null: false
      add :hashed_password, :string, null: false
      add :role, :string, null: false
      timestamps()
    end

    create unique_index(:users, [:username])

    create table(:user_tokens) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :token, :binary, null: false
      add :context, :string, null: false
      timestamps(updated_at: false)
    end

    create index(:user_tokens, [:user_id])
    create unique_index(:user_tokens, [:context, :token])
  end
end
