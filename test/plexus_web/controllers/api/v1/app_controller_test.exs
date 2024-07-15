defmodule PlexusWeb.API.V1.AppControllerTest do
  use PlexusWeb.ConnCase, async: true

  import Plexus.AppsFixtures

  @create_attrs %{
    name: unique_app_name(),
    package: unique_app_package(),
    icon_url: "https://some-website.com/image/123"
  }

  @invalid_attrs %{name: nil, package: nil}

  setup [:setup_json, :setup_authenticated_device]

  describe "index" do
    test "lists all apps", %{conn: conn} do
      conn = get(conn, ~p"/api/v1/apps")
      assert %{"data" => data} = json_response(conn, 200)
      assert is_list(data)
    end

    test "renders meta", %{conn: conn} do
      conn = get(conn, ~p"/api/v1/apps")

      assert %{
               "meta" => %{
                 "page_number" => 1,
                 "limit" => 25,
                 "total_count" => _,
                 "total_pages" => _
               }
             } = json_response(conn, 200)
    end

    test "with scores", %{conn: conn} do
      opts = %{scores: true}
      conn = get(conn, ~p"/api/v1/apps?#{opts}")

      for app <- json_response(conn, 200)["data"] do
        assert is_map(app["scores"])
      end
    end
  end

  describe "create app" do
    test "renders app when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/v1/apps", app: @create_attrs)

      assert %{"package" => package, "name" => name, "icon_url" => icon_url} =
               json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/v1/apps/#{package}")

      assert %{
               "package" => ^package,
               "name" => ^name,
               "icon_url" => ^icon_url
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

    test "renders error when package is already taken", %{conn: conn} do
      app = app_fixture()
      attrs = %{@create_attrs | package: app.package}

      conn = post(conn, ~p"/api/v1/apps", app: attrs)
      assert %{"errors" => %{"package" => ["has already been taken"]}} = json_response(conn, 422)
    end
  end
end
