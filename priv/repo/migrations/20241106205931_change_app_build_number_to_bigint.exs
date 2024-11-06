defmodule Plexus.Repo.Migrations.ChangeAppBuildNumberToBigint do
  use Ecto.Migration

  def change do
    alter table(:ratings) do
      modify :app_build_number, :bigint, from: :integer
    end
  end
end
