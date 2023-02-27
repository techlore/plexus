defmodule Plexus.AppsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Plexus.Apps` context.
  """

  @doc """
  Generate a unique app name.
  """
  def unique_app_name, do: "App #{System.unique_integer([:positive])}"

  @doc """
  Generate a unique app package.
  """
  def unique_app_package, do: "com.package.app#{System.unique_integer([:positive])}"

  @doc """
  Generate a app.
  """
  def app_fixture(attrs \\ %{}) do
    {:ok, app} =
      attrs
      |> Enum.into(%{
        name: unique_app_name(),
        package: unique_app_package()
      })
      |> Plexus.Apps.create_app()

    app
  end
end
