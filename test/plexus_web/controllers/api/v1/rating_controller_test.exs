defmodule PlexusWeb.API.V1.RatingControllerTest do
  use PlexusWeb.ConnCase, async: true

  import Plexus.AppsFixtures

  @create_attrs %{
    app_build_number: 42,
    app_version: "some app_version",
    google_lib: :none,
    notes: "some notes",
    score: 2,
    rom_name: "some ROM name",
    rom_version: "some ROM version",
    rom_build: "some ROM build"
  }

  @invalid_attrs %{
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
      app = app_fixture()
      conn = get(conn, ~p"/api/v1/apps/#{app}/ratings")
      assert json_response(conn, 200)["data"] == []
    end

    test "renders meta", %{conn: conn} do
      app = app_fixture()
      conn = get(conn, ~p"/api/v1/apps/#{app}/ratings")

      assert %{
               "meta" => %{
                 "page_number" => 1,
                 "limit" => 25,
                 "total_count" => 0,
                 "total_pages" => 1
               }
             } = json_response(conn, 200)
    end
  end

  describe "create rating" do
    test "renders rating when data is valid", %{conn: conn} do
      %{package: app_package} = app_fixture()
      attrs = Map.put(@create_attrs, :app_package, app_package)

      conn = post(conn, ~p"/api/v1/apps/#{app_package}/ratings", rating: attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/v1/apps/#{app_package}/ratings/#{id}")

      assert %{
               "id" => ^id,
               "app_package" => ^app_package,
               "app_build_number" => 42,
               "app_version" => "some app_version",
               "rom_name" => "some ROM name",
               "rom_version" => "some ROM version",
               "rom_build" => "some ROM build",
               "google_lib" => "none",
               "notes" => "some notes",
               "score" => %{"numerator" => 2, "denominator" => 4}
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      app = app_fixture()
      conn = post(conn, ~p"/api/v1/apps/#{app}/ratings", rating: @invalid_attrs)

      assert %{
               "errors" => %{
                 "app_build_number" => ["can't be blank"],
                 "app_version" => ["can't be blank"],
                 "google_lib" => ["can't be blank"],
                 "score" => ["can't be blank"]
               }
             } = json_response(conn, 422)
    end

    test "renders error when score is out of upper range", %{conn: conn} do
      app = app_fixture()
      attrs = Map.put(@create_attrs, :score, 5)

      conn = post(conn, ~p"/api/v1/apps/#{app}/ratings", rating: attrs)

      assert %{
               "errors" => %{
                 "score" => ["must be less than or equal to 4"]
               }
             } = json_response(conn, 422)
    end

    test "renders error when score is out of lower range", %{conn: conn} do
      app = app_fixture()
      attrs = Map.put(@create_attrs, :score, 0)

      conn = post(conn, ~p"/api/v1/apps/#{app}/ratings", rating: attrs)

      assert %{
               "errors" => %{
                 "score" => ["must be greater than or equal to 1"]
               }
             } = json_response(conn, 422)
    end
  end
end
