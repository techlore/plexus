defmodule Plexus.RatingsTest do
  use Plexus.DataCase, async: true

  import Plexus.AppsFixtures
  import Plexus.RatingsFixtures

  alias Plexus.Apps
  alias Plexus.Ratings
  alias Plexus.Schemas.App
  alias Plexus.Schemas.Rating

  @invalid_attrs %{
    app_package: "",
    app_build_number: nil,
    rating_type: nil,
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
        rating_type: :native,
        notes: "some notes",
        score: 3,
        installation_source: "fdroid",
        rom_name: "some ROM name",
        rom_build: "some ROM build"
      }

      assert {:ok, %Rating{} = rating, _delete_token} = Ratings.create_rating(valid_attrs)
      assert rating.android_version == "some android_version"
      assert rating.app_package == app.package
      assert rating.app_build_number == 42
      assert rating.app_version == "some app_version"
      assert rating.rating_type == :native
      assert rating.notes == "some notes"
      assert rating.score == 3
      assert rating.installation_source == "fdroid"
      assert rating.rom_name == "some ROM name"
      assert rating.rom_build == "some ROM build"
    end

    test "handles optional app_version" do
      app = app_fixture()

      valid_attrs = %{
        app_package: app.package,
        android_version: "some android_version",
        app_build_number: 42,
        app_version: nil,
        rating_type: :native,
        score: 3,
        installation_source: "fdroid",
        rom_name: "some ROM name",
        rom_build: "some ROM build"
      }

      assert {:ok, %Rating{}, _delete_token} = Ratings.create_rating(valid_attrs)
    end

    test "invalid data returns error changeset" do
      assert {:error, _reason} = Ratings.create_rating(@invalid_attrs)
    end
  end

  describe "delete_rating/1" do
    test "deletes the rating" do
      rating = rating_fixture()

      assert {:ok, %Rating{}} = Ratings.delete_rating(rating)
      assert_raise Ecto.NoResultsError, fn -> Ratings.get_rating!(rating.id) end
    end

    test "deletes the app when it was the last rating for that app" do
      app = app_fixture()
      rating = rating_fixture(%{app_package: app.package})

      assert {:ok, %Rating{}} = Ratings.delete_rating(rating)
      assert {:error, :not_found} = Apps.fetch_app(app.package)
    end

    test "keeps the app when other ratings still exist for it" do
      app = app_fixture()
      rating = rating_fixture(%{app_package: app.package})
      _other_rating = rating_fixture(%{app_package: app.package})

      assert {:ok, %Rating{}} = Ratings.delete_rating(rating)
      assert {:ok, %App{}} = Apps.fetch_app(app.package)
    end
  end

  describe "delete_rating/2" do
    test "deletes the rating with a valid delete_token" do
      {rating, delete_token} = rating_fixture_with_delete_token()

      assert {:ok, %Rating{}} = Ratings.delete_rating(rating, delete_token)
    end

    test "returns :unauthorized with an invalid delete_token" do
      rating = rating_fixture()

      assert {:error, :unauthorized} = Ratings.delete_rating(rating, "invalid-token")
    end

    test "deletes the app when it was the last rating for that app" do
      app = app_fixture()
      {rating, delete_token} = rating_fixture_with_delete_token(%{app_package: app.package})

      assert {:ok, %Rating{}} = Ratings.delete_rating(rating, delete_token)
      assert {:error, :not_found} = Apps.fetch_app(app.package)
    end
  end
end
