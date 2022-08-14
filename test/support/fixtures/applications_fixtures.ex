defmodule Plexus.ApplicationsFixtures do
  def unique_application_name, do: "application#{System.unique_integer()}"
  def unique_application_package, do: "com.application-#{System.unique_integer()}"

  def valid_application_attributes(attrs \\ %{}) do
    Enum.into(attrs, %{
      name: unique_application_name(),
      package: unique_application_package()
    })
  end

  def application_fixture(attrs \\ %{}) do
    {:ok, application} =
      attrs
      |> valid_application_attributes()
      |> Plexus.Applications.create_application()

    application
  end
end
