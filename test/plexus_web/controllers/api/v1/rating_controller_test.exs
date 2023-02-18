defmodule PlexusWeb.Controllers.Api.V1.RatingControllerTest do
  use PlexusWeb.ConnCase, async: true

  import Plexus.ApplicationsFixtures

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
end
