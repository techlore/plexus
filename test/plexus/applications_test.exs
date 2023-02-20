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

    test "raises error when not found" do
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

  describe "create_application/1" do
    test "with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Applications.create_application(@invalid_attrs)
    end

    test "with valid data creates an application" do
      name = unique_application_name()
      package = unique_application_package()
      attrs = %{name: name, package: package}
      assert {:ok, %Application{} = application} = Applications.create_application(attrs)

      assert application.name == name
      assert application.package == package
    end
  end
end
