defmodule Plexus.RatingsTest do
  use Plexus.DataCase, async: true

  import Plexus.AppsFixtures
  import Plexus.RatingsFixtures

  alias Plexus.Ratings
  alias Plexus.Schemas.Rating

  @invalid_attrs %{
    app_package: nil,
    app_build_number: nil,
    app_version: nil,
    google_lib: nil,
    rom_name: nil,
    rom_build: nil,
    installation_source: nil,
    notes: nil,
    score: nil
  }

  describe "list_ratings/1" do
    test "returns a page of ratings" do
      app = app_fixture()
      rating = rating_fixture(%{app_package: app.package})
      assert %Scrivener.Page{entries: [^rating]} = Ratings.list_ratings(app.package)
    end
  end

  describe "get_rating!/2" do
    test "returns the rating with given id" do
      rating = rating_fixture()
      assert Ratings.get_rating!(rating.id) == rating
    end
  end

  describe "create_rating!/1" do
    test "with valid data creates a rating" do
      app = app_fixture()

      valid_attrs = %{
        app_package: app.package,
        android_version: "some android_version",
        app_build_number: 42,
        app_version: "some app_version",
        google_lib: :none,
        notes: "some notes",
        score: 3,
        installation_source: "fdroid",
        rom_name: "some ROM name",
        rom_build: "some ROM build"
      }

      assert {:ok, %Rating{} = rating} = Ratings.create_rating(valid_attrs)
      assert rating.android_version == "some android_version"
      assert rating.app_package == app.package
      assert rating.app_build_number == 42
      assert rating.app_version == "some app_version"
      assert rating.google_lib == :none
      assert rating.notes == "some notes"
      assert rating.score == 3
      assert rating.installation_source == "fdroid"
      assert rating.rom_name == "some ROM name"
      assert rating.rom_build == "some ROM build"
    end

    test "invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ratings.create_rating(@invalid_attrs)
    end
  end
end
