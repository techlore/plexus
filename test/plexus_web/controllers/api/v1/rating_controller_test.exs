defmodule PlexusWeb.API.V1.RatingControllerTest do
  use PlexusWeb.ConnCase, async: true

  import Plexus.AppsFixtures
  import Plexus.RatingsFixtures

  alias Plexus.Schemas.Rating

  @create_attrs %{
    app_build_number: 42,
    app_version: "some app_version",
    google_lib: :none,
    notes: "some notes",
    score: 2
  }
  @update_attrs %{
    app_build_number: 43,
    app_version: "some updated app_version",
    google_lib: :micro_g,
    notes: "some updated notes",
    score: 3
  }
  @invalid_attrs %{
    app_package: nil,
    app_build_number: nil,
    app_version: nil,
    google_lib: nil,
    notes: nil,
    score: nil
  }

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all ratings", %{conn: conn} do
      conn = get(conn, ~p"/api/v1/ratings")
      assert json_response(conn, 200)["data"] == []
    end

    test "renders meta", %{conn: conn} do
      conn = get(conn, ~p"/api/v1/ratings")

      assert %{
               "meta" => %{
                 "page_number" => 1,
                 "limit" => 15,
                 "total_count" => 0,
                 "total_pages" => 1
               }
             } = json_response(conn, 200)
    end
  end

  describe "create rating" do
    test "renders rating when data is valid", %{conn: conn} do
      %{name: app_name, package: app_package} = app_fixture()
      attrs = Map.put(@create_attrs, :app_package, app_package)

      conn = post(conn, ~p"/api/v1/ratings", rating: attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/v1/ratings/#{id}")

      assert %{
               "id" => ^id,
               "app_name" => ^app_name,
               "app_package" => ^app_package,
               "app_build_number" => 42,
               "app_version" => "some app_version",
               "google_lib" => "none",
               "notes" => "some notes",
               "score" => %{"numerator" => 2, "denominator" => 4}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/v1/ratings", rating: @invalid_attrs)

      assert %{
               "errors" => %{
                 "app_build_number" => ["can't be blank"],
                 "app_package" => ["can't be blank"],
                 "app_version" => ["can't be blank"],
                 "google_lib" => ["can't be blank"],
                 "score" => ["can't be blank"]
               }
             } = json_response(conn, 422)
    end

    test "renders error when score is out of upper range", %{conn: conn} do
      app = app_fixture()

      attrs =
        @create_attrs
        |> Map.put(:app_package, app.package)
        |> Map.put(:score, 5)

      conn = post(conn, ~p"/api/v1/ratings", rating: attrs)

      assert %{
               "errors" => %{
                 "score" => ["must be less than or equal to 4"]
               }
             } = json_response(conn, 422)
    end

    test "renders error when score is out of lower range", %{conn: conn} do
      app = app_fixture()

      attrs =
        @create_attrs
        |> Map.put(:app_package, app.package)
        |> Map.put(:score, 0)

      conn = post(conn, ~p"/api/v1/ratings", rating: attrs)

      assert %{
               "errors" => %{
                 "score" => ["must be greater than or equal to 1"]
               }
             } = json_response(conn, 422)
    end
  end

  describe "update rating" do
    setup [:create_rating]

    test "renders rating when data is valid", %{conn: conn, rating: rating} do
      %Rating{id: id, app: %{name: app_name, package: app_package}} = rating

      conn = put(conn, ~p"/api/v1/ratings/#{rating}", rating: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/v1/ratings/#{id}")

      assert %{
               "id" => ^id,
               "app_name" => ^app_name,
               "app_package" => ^app_package,
               "app_build_number" => 43,
               "app_version" => "some updated app_version",
               "google_lib" => "micro_g",
               "notes" => "some updated notes",
               "score" => %{"numerator" => 3, "denominator" => 4}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, rating: rating} do
      conn = put(conn, ~p"/api/v1/ratings/#{rating}", rating: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  defp create_rating(_) do
    rating = rating_fixture()
    %{rating: Plexus.Repo.preload(rating, :app)}
  end
end
