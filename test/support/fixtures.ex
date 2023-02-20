defmodule Plexus.Fixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Plexus` context.
  """
  alias Plexus.Applications
  alias Plexus.Ratings
  alias Plexus.Schemas.Enums

  ## Applications ##############################################################

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
      |> Applications.create_application()

    application
  end

  ## Ratings ###################################################################

  def valid_rating_attributes(attrs \\ %{}) do
    Enum.into(attrs, %{
      application_id: application_fixture().id,
      application_version: unique_application_version(),
      application_build_number: unique_application_build_number(),
      google_lib: google_lib(),
      score: Enum.random(1..4),
      notes: gnu_linux()
    })
  end

  def rating_fixture(attrs \\ %{}) do
    {:ok, rating} =
      attrs
      |> valid_rating_attributes()
      |> Ratings.create_rating()

    rating
  end

  ## Generators ################################################################

  defp google_lib do
    Enums.GoogleLib.values()
    |> Enum.random()
  end

  def unique_application_name do
    "application#{System.unique_integer()}"
  end

  def unique_application_package do
    "com.plexus.application-#{System.unique_integer()}"
  end

  def unique_application_version do
    "#{:rand.uniform(69)}-#{:rand.uniform(69)}-#{:rand.uniform(69)}"
  end

  def unique_application_build_number do
    System.unique_integer([:positive])
  end

  defp gnu_linux do
    """
    I'd just like to interject for a moment.  What you're referring to as Linux,
    is in fact, GNU/Linux, or as I've recently taken to calling it, GNU plus Linux.
    Linux is not an operating system unto itself, but rather another free component
    of a fully functioning GNU system made useful by the GNU corelibs, shell
    utilities and vital system components comprising a full OS as defined by POSIX.

    Many computer users run a modified version of the GNU system every day,
    without realizing it.  Through a peculiar turn of events, the version of GNU
    which is widely used today is often called "Linux", and many of its users are
    not aware that it is basically the GNU system, developed by the GNU Project.

    There really is a Linux, and these people are using it, but it is just a
    part of the system they use.  Linux is the kernel: the program in the system
    that allocates the machine's resources to the other programs that you run.
    The kernel is an essential part of an operating system, but useless by itself;
    it can only function in the context of a complete operating system.  Linux is
    normally used in combination with the GNU operating system: the whole system
    is basically GNU with Linux added, or GNU/Linux.  All the so-called "Linux"
    distributions are really distributions of GNU/Linux.
    """
  end
end
