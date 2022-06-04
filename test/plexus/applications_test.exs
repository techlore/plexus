defmodule Plexus.ApplicationsTest do
  use Plexus.DataCase, async: true

  alias Plexus.Applications
  alias Plexus.Schemas.Application

  describe "create_application/1" do
    test "with invalid data returns error changeset" do
      invalid_attrs = %{name: nil}
      assert {:error, %Ecto.Changeset{}} = Applications.create_application(invalid_attrs)
    end

    test "with valid data creates an application" do
      valid_attrs = %{
        name: "Unique 42",
        package: "tech.techlore.plexus"
      }

      assert {:ok, %Application{} = application} = Applications.create_application(valid_attrs)

      assert application.name == "Unique 42"
      assert application.package == "tech.techlore.plexus"
    end
  end
end
