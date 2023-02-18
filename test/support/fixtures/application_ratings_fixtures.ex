defmodule Plexus.ApplicationRatingsFixtures do
  def unique_application_version do
    "#{:rand.uniform(69)}-#{:rand.uniform(69)}-#{:rand.uniform(69)}"
  end

  def unique_application_build_number, do: System.unique_integer([:positive])

  def valid_application_rating_attributes(attrs \\ %{}) do
    Enum.into(attrs, %{
      application_id: Plexus.ApplicationsFixtures.application_fixture().id,
      application_version: unique_application_version(),
      application_build_number: unique_application_build_number(),
      status: :approved,
      google_lib: :micro_g,
      rating: 4,
      notes: "vim > emacs"
    })
  end

  def application_rating_fixture(attrs \\ %{}) do
    {:ok, rating} =
      attrs
      |> valid_application_rating_attributes()
      |> Plexus.ApplicationRatings.create_application_rating()

    rating
  end
end
