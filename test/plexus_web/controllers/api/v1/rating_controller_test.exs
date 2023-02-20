defmodule PlexusWeb.Controllers.Api.V1.RatingControllerTest do
  use PlexusWeb.ConnCase, async: true

  import Plexus.Fixtures

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
          score: score,
          notes: notes
        } = rating_fixture()

      conn = get(conn, Routes.v1_rating_path(conn, :show, application_id, id))

      status = to_string(application_rating.status)
      google_lib = to_string(application_rating.google_lib)

      assert %{
               "id" => ^id,
               "application_version" => ^application_version,
               "application_build_number" => ^application_build_number,
               "status" => ^status,
               "google_lib" => ^google_lib,
               "score" => ^score,
               "notes" => ^notes
             } = json_response(conn, 200)["data"]
    end
  end

  describe "create ratings" do
    test "renders rating when data is valid", %{conn: conn} do
      attrs = valid_rating_attributes()

      conn = post(conn, Routes.v1_rating_path(conn, :create, attrs.application_id), rating: attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.v1_rating_path(conn, :show, attrs.application_id, id))
      assert %{"id" => ^id} = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.v1_rating_path(conn, :create, application_fixture()), rating: %{})
      assert json_response(conn, 422)["errors"] != %{}
    end
  end
end
