defmodule Plexus.ApplicationsTest do
  use Plexus.DataCase, async: true

  import Plexus.Fixtures

  alias Plexus.Applications
  alias Plexus.Schemas.Application

  @invalid_attrs %{name: nil, package: nil}

  describe "fetch_application!/1" do
    setup do
      application = application_fixture()
      [application: application]
    end

    test "returns an application struct", %{application: application} do
      assert %Application{} = Applications.fetch_application!(application.id)
    end

    test "raises an error when not found" do
      application_id = Ecto.UUID.generate()

      assert_raise Ecto.NoResultsError, fn ->
        Applications.fetch_application!(application_id)
      end
    end

    test "includes rating score", %{application: application} do
      for score <- 1..4 do
        rating_fixture(%{application_id: application.id, score: score, google_lib: :none})
      end

      # we validate that the average score is 2. avg(1 + 2 + 3 + 4) == 2
      avg_score = 2

      assert %Application{score: ^avg_score} = Applications.fetch_application!(application.id)
    end

    test "includes MicroG rating score", %{application: application} do
      for score <- 2..4 do
        rating_fixture(%{application_id: application.id, score: score, google_lib: :micro_g})
      end

      # we validate that the average score is 2. avg(2 + 3 + 4) == 3
      avg_score = 3

      assert %Application{micro_g_score: ^avg_score} =
               Applications.fetch_application!(application.id)
    end

    test "scores are nil without ratings", %{application: application} do
      assert %Application{score: nil, micro_g_score: nil} =
               Applications.fetch_application!(application.id)
    end
  end

  describe "list_applications/1" do
    setup do
      application = application_fixture()

      rating_fixture(%{application_id: application.id, score: 2, google_lib: :none})
      rating_fixture(%{application_id: application.id, score: 4, google_lib: :micro_g})

      [applications: [application], score: 2, micro_g_score: 4]
    end

    test "returns a page with a list of application structs" do
      assert %Scrivener.Page{entries: applications} = Applications.list_applications()

      for application <- applications do
        assert is_struct(application, Application)
      end
    end

    test "paginating with page opt" do
      for _ <- 1..15, do: application_fixture()
      assert %Scrivener.Page{page_number: 1} = Applications.list_applications()
      assert %Scrivener.Page{page_number: 2} = Applications.list_applications(page: 2)
    end
  end

  describe "create_application/1" do
    test "with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Applications.create_application(@invalid_attrs)
    end

    test "validates required fields" do
      {:error, changeset} = Applications.create_application(%{})

      assert %{
               name: ["can't be blank"],
               package: ["can't be blank"]
             } = errors_on(changeset)
    end

    test "with valid data creates an application" do
      attrs = valid_application_attributes()
      assert {:ok, %Application{} = application} = Applications.create_application(attrs)
      assert application.name == attrs.name
      assert application.package == attrs.package
    end

    test "handles unique name constraint" do
      application = application_fixture()
      attrs = valid_application_attributes(name: application.name)
      assert {:error, changeset} = Applications.create_application(attrs)
      assert %{name: ["has already been taken"]} = errors_on(changeset)
    end

    test "handles unique package constraint" do
      application = application_fixture()
      attrs = valid_application_attributes(package: application.package)
      assert {:error, changeset} = Applications.create_application(attrs)
      assert %{package: ["has already been taken"]} = errors_on(changeset)
    end
  end
end
