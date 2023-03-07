defmodule Plexus.RatingsTest do
  use Plexus.DataCase, async: true

  import Plexus.AppsFixtures
  import Plexus.RatingsFixtures

  alias Plexus.Ratings
  alias Plexus.Schemas.Rating

  @invalid_attrs %{
    app_build_number: nil,
    app_version: nil,
    google_lib: nil,
    notes: nil,
    score: nil
  }

  describe "list_ratings/1" do
    test "returns a page of ratings" do
      rating = rating_fixture()
      assert %Scrivener.Page{entries: [^rating]} = Ratings.list_ratings()
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
        app_build_number: 42,
        app_version: "some app_version",
        google_lib: :none,
        notes: "some notes",
        score: 3
      }

      assert {:ok, %Rating{} = rating} = Ratings.create_rating(valid_attrs)
      assert rating.app_package == app.package
      assert rating.app_build_number == 42
      assert rating.app_version == "some app_version"
      assert rating.google_lib == :none
      assert rating.notes == "some notes"
      assert rating.score == 3
    end

    test "invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ratings.create_rating(@invalid_attrs)
    end
  end

  test "with valid data updates the rating" do
    rating = rating_fixture()
    app = app_fixture()

    update_attrs = %{
      app_package: app.package,
      app_build_number: 43,
      app_version: "some updated app_version",
      google_lib: :micro_g,
      notes: "some updated notes",
      score: 4
    }

    assert {:ok, %Rating{} = rating} = Ratings.update_rating(rating, update_attrs)
    assert rating.app_package == app.package
    assert rating.app_build_number == 43
    assert rating.app_version == "some updated app_version"
    assert rating.google_lib == :micro_g
    assert rating.notes == "some updated notes"
    assert rating.score == 4
  end

  describe "update_ratings/2" do
    test "with invalid data returns error changeset" do
      rating = rating_fixture()

      assert {:error, %Ecto.Changeset{}} = Ratings.update_rating(rating, @invalid_attrs)
      assert rating == Ratings.get_rating!(rating.id)
    end
  end

  describe "delete_rating/1" do
    test "deletes the rating" do
      rating = rating_fixture()
      assert {:ok, %Rating{}} = Ratings.delete_rating(rating)
      assert_raise Ecto.NoResultsError, fn -> Ratings.get_rating!(rating.id) end
    end
  end

  describe "change_rating/1" do
    test "returns a rating changeset" do
      rating = rating_fixture()
      assert %Ecto.Changeset{} = Ratings.change_rating(rating)
    end
  end

  describe "preload_app/1" do
    test "returns a rating with its app preloaded" do
      rating = rating_fixture()
      assert %Rating{app: %Plexus.Schemas.App{}} = Ratings.preload_app(rating)
    end
  end
end
