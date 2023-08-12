defmodule Plexus.AppsTest do
  use Plexus.DataCase, async: true

  import Plexus.AppsFixtures
  import Plexus.RatingsFixtures

  alias Plexus.Apps
  alias Plexus.Schemas.App
  alias Plexus.Schemas.Score

  @invalid_attrs %{name: nil, package: nil}

  describe "list_apps/1" do
    test "returns a page of apps" do
      assert %Scrivener.Page{entries: apps} = Apps.list_apps()

      for app <- apps do
        assert is_struct(app, App)
      end
    end

    test "with scores" do
      app_fixture()
      %Scrivener.Page{entries: apps} = Apps.list_apps(scores: true)

      for %App{scores: scores} <- apps do
        assert %Score{rating_type: :native} = scores.native
        assert %Score{rating_type: :micro_g} = scores.micro_g
      end
    end
  end

  describe "get_app!/2" do
    test "returns the app with given package" do
      app = app_fixture()
      assert Apps.get_app!(app.package) == app
    end

    test "with scores" do
      %{package: app_package} = app_fixture()
      rating_fixture(%{app_package: app_package, score: 3, rating_type: :micro_g})
      rating_fixture(%{app_package: app_package, score: 4, rating_type: :micro_g})
      rating_fixture(%{app_package: app_package, score: 4, rating_type: :micro_g})
      rating_fixture(%{app_package: app_package, score: 1, rating_type: :native})
      rating_fixture(%{app_package: app_package, score: 2, rating_type: :native})

      app = Apps.get_app!(app_package, scores: true)

      assert %Score{
               app_package: ^app_package,
               rating_type: :native,
               numerator: 1.5,
               denominator: 4,
               total_count: 2
             } = app.scores.native

      assert %Score{
               app_package: ^app_package,
               rating_type: :micro_g,
               numerator: 3.67,
               denominator: 4,
               total_count: 3
             } = app.scores.micro_g
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
end
