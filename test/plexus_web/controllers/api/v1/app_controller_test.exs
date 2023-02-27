defmodule PlexusWeb.API.V1.AppControllerTest do
  use PlexusWeb.ConnCase

  import Plexus.AppsFixtures

  @create_attrs %{
    name: unique_app_name(),
    package: unique_app_package()
  }

  @invalid_attrs %{name: nil, package: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all apps", %{conn: conn} do
      conn = get(conn, ~p"/api/v1/apps")

      assert %{"data" => []} = json_response(conn, 200)
    end

    test "renders meta", %{conn: conn} do
      conn = get(conn, ~p"/api/v1/apps")

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

  describe "create app" do
    test "renders app when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/v1/apps", app: @create_attrs)
      assert %{"package" => package, "name" => name} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/v1/apps/#{package}")

      assert %{
               "package" => ^package,
               "name" => ^name
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/v1/apps", app: @invalid_attrs)

      assert %{
               "errors" => %{
                 "name" => ["can't be blank"],
                 "package" => ["can't be blank"]
               }
             } = json_response(conn, 422)
    end

    test "renders error when name is already taken", %{conn: conn} do
      app = app_fixture()
      attrs = %{@create_attrs | name: app.name}

      conn = post(conn, ~p"/api/v1/apps", app: attrs)
      assert %{"errors" => %{"name" => ["has already been taken"]}} = json_response(conn, 422)
    end

    test "renders error when package is already taken", %{conn: conn} do
      app = app_fixture()
      attrs = %{@create_attrs | package: app.package}

      conn = post(conn, ~p"/api/v1/apps", app: attrs)
      assert %{"errors" => %{"package" => ["has already been taken"]}} = json_response(conn, 422)
    end
  end
end
