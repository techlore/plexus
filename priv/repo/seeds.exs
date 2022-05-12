# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Plexus.Repo.insert!(%Plexus.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
data_path = Path.join(["#{:code.priv_dir(:plexus)}", "repo", "seeds", "data.json"])

data_path
|> File.read!()
|> Jason.decode!()
|> Enum.map(fn app ->
  params = %{
    name: app["Application"],
    package: app["Package"]
  }

  Plexus.Applications.create!(params)
end)
