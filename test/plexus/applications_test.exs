defmodule Plexus.ApplicationsTest do
  use Plexus.DataCase, async: true

  import Plexus.ApplicationsFixtures

  alias Plexus.Applications
  alias Plexus.Schemas.Application

  @invalid_attrs %{name: nil, package: nil}

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
