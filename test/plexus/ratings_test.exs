defmodule Plexus.RatingsTest do
  use Plexus.DataCase, async: true

  import Plexus.Fixtures

  alias Plexus.Ratings
  alias Plexus.Schemas.Rating

  describe "fetch_rating!/1" do
    test "returns a rating struct" do
      rating = rating_fixture()
      assert %Rating{} = Ratings.fetch_rating!(rating.id)
    end

    test "raises an error when not found" do
      rating_id = Ecto.UUID.generate()

      assert_raise Ecto.NoResultsError, fn ->
        Ratings.fetch_rating!(rating_id)
      end
    end
  end

  describe "list_ratings/2" do
    setup do
      application = application_fixture()
      rating = rating_fixture(%{application_package: application.package})

      [application: application, ratings: [rating]]
    end

    test "returns a page with a list of rating structs", %{application: application} do
      assert %Scrivener.Page{entries: ratings} = Ratings.list_ratings(application.package)

      for rating <- ratings do
        assert is_struct(rating, Rating)
      end
    end

    test "paginating with page opt", %{application: application} do
      for _ <- 1..15, do: rating_fixture(application_package: application.package)

      assert %Scrivener.Page{page_number: 1} = Ratings.list_ratings(application.package)
      assert %Scrivener.Page{page_number: 2} = Ratings.list_ratings(application.package, page: 2)
    end
  end

  describe "create_rating/1" do
    test "with invalid data returns error changeset" do
      invalid_attrs = %{
        application_package: nil,
        application_version: nil,
        application_build_number: nil,
        google_lib: nil,
        score: 69
      }

      assert {:error, %Ecto.Changeset{}} = Ratings.create_rating(invalid_attrs)
    end

    test "validates required fields" do
      {:error, changeset} = Ratings.create_rating(%{})

      assert %{
               application_build_number: ["can't be blank"],
               application_package: ["can't be blank"],
               application_version: ["can't be blank"],
               google_lib: ["can't be blank"],
               score: ["can't be blank"]
             } = errors_on(changeset)
    end

    test "with valid data creates an application_rating" do
      application = application_fixture()
      attrs = valid_rating_attributes(%{application_package: application.package})

      assert {:ok, %Rating{} = rating} = Ratings.create_rating(attrs)

      assert rating.application_package == application.package
      assert rating.application_version == attrs.application_version
      assert rating.application_build_number == attrs.application_build_number
      assert rating.google_lib == attrs.google_lib
      assert rating.score == attrs.score
      assert rating.notes == attrs.notes
    end
  end
end
