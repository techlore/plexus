defmodule Plexus.AppsTest do
  use Plexus.DataCase, async: true

  import Plexus.AppsFixtures

  alias Plexus.Apps
  alias Plexus.Schemas.App

  @invalid_attrs %{name: nil, package: nil}

  describe "list_apps/0" do
    test "returns a page of apps" do
      app = app_fixture()
      assert %Scrivener.Page{entries: [^app]} = Apps.list_apps()
    end
  end

  describe "get_app!/1" do
    test " returns the app with given package" do
      app = app_fixture()
      assert Apps.get_app!(app.package) == app
    end
  end

  describe "create_app/1" do
    test "with valid data creates a app" do
      valid_attrs = %{name: unique_app_name(), package: unique_app_package()}

      assert {:ok, %App{} = app} = Apps.create_app(valid_attrs)
      assert app.name == valid_attrs.name
      assert app.package == valid_attrs.package
    end

    test "with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Apps.create_app(@invalid_attrs)
    end

    test "with duplicate package returns error changeset" do
      app = app_fixture()

      attrs = %{package: app.package, name: unique_app_name()}
      assert {:error, %Ecto.Changeset{}} = Apps.create_app(attrs)
    end

    test "with duplicate name returns error changeset" do
      app = app_fixture()

      attrs = %{package: unique_app_package(), name: app.name}
      assert {:error, %Ecto.Changeset{}} = Apps.create_app(attrs)
    end
  end

  describe "update_app/2" do
    test "with valid data updates the app" do
      app = app_fixture()

      update_attrs = %{name: unique_app_name(), package: unique_app_package()}
      assert {:ok, %App{} = app} = Apps.update_app(app, update_attrs)
      assert app.name == update_attrs.name
      assert app.package == update_attrs.package
    end

    test "with invalid data returns error changeset" do
      app = app_fixture()

      assert {:error, %Ecto.Changeset{}} = Apps.update_app(app, @invalid_attrs)
      assert app == Apps.get_app!(app.package)
    end

    test "with duplicate package returns error changeset" do
      app = app_fixture()
      app2 = app_fixture()

      attrs = %{package: app2.package}
      assert {:error, %Ecto.Changeset{}} = Apps.update_app(app, attrs)
      assert app == Apps.get_app!(app.package)
    end

    test "with duplicate name returns error changeset" do
      app = app_fixture()
      app2 = app_fixture()

      attrs = %{name: app2.name}
      assert {:error, %Ecto.Changeset{}} = Apps.update_app(app, attrs)
      assert app == Apps.get_app!(app.package)
    end
  end

  describe "delete_app/1" do
    test "deletes the app" do
      app = app_fixture()

      assert {:ok, %App{}} = Apps.delete_app(app)
      assert_raise Ecto.NoResultsError, fn -> Apps.get_app!(app.package) end
    end
  end

  describe "change_app/1" do
    test "returns an app changeset" do
      app = app_fixture()
      assert %Ecto.Changeset{} = Apps.change_app(app)
    end
  end
end
