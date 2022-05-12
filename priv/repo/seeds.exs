# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
Path.join(["#{:code.priv_dir(:plexus)}", "repo/seeds/data.json"])
|> File.read!()
|> Jason.decode!()
|> Enum.map(fn data ->
  application =
    Plexus.Applications.create!(%{
      name: data["Application"],
      package: data["Package"]
    })

  if data["DG_Rating"] do
    Plexus.ApplicationRatings.create!(%{
      application_id: application.id,
      application_version: data["Version"],
      application_version_number: :rand.uniform(999_999_999),
      status: :approved,
      google_lib: :none,
      rating: data["DG_Rating"],
      notes: data["DG_Notes"]
    })
  end

  if data["MG_Rating"] do
    Plexus.ApplicationRatings.create!(%{
      application_id: application.id,
      application_version: data["Version"],
      application_version_number: :rand.uniform(999_999_999),
      status: :approved,
      google_lib: :micro_g,
      rating: data["MG_Rating"],
      notes: data["MG_Notes"]
    })
  end
end)
