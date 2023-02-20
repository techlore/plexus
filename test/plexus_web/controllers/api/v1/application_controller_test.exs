defmodule PlexusWeb.API.V1.ApplicationControllerTest do
  use PlexusWeb.ConnCase, async: true

  import Plexus.Fixtures

  @invalid_attrs %{name: nil, package: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all applications", %{conn: conn} do
      conn = get(conn, Routes.v1_application_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create applications" do
    test "renders application when data is valid", %{conn: conn} do
      name = unique_application_name()
      package = unique_application_package()
      attrs = %{name: name, package: package}
      conn = post(conn, Routes.v1_application_path(conn, :create), application: attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.v1_application_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "name" => ^name,
               "package" => ^package
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.v1_application_path(conn, :create), application: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end
end
