defmodule PlexusWeb.Controllers.Api.V1.RatingControllerTest do
  use PlexusWeb.ConnCase, async: true

  import Plexus.ApplicationsFixtures
  import Plexus.ApplicationRatingsFixtures

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all ratings for the given application", %{conn: conn} do
      application = application_fixture()
      conn = get(conn, Routes.v1_rating_path(conn, :index, application))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "show" do
    test "fetches the application rating", %{conn: conn} do
      application_rating =
        %{
          id: id,
          application_id: application_id,
          application_version: application_version,
          application_build_number: application_build_number,
          rating: rating,
          notes: notes
        } = application_rating_fixture()

      conn = get(conn, Routes.v1_rating_path(conn, :show, application_id, id))

      status = to_string(application_rating.status)
      google_lib = to_string(application_rating.google_lib)

      assert %{
               "id" => ^id,
               "application_version" => ^application_version,
               "application_build_number" => ^application_build_number,
               "status" => ^status,
               "google_lib" => ^google_lib,
               "rating" => ^rating,
               "notes" => ^notes
             } = json_response(conn, 200)["data"]
    end
  end
end
