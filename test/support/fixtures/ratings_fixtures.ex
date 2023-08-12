defmodule Plexus.RatingsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Plexus.Ratings` context.
  """

  @doc """
  Generate a unique app version.
  """
  def unique_app_version do
    "v#{:rand.uniform(69)}-#{:rand.uniform(69)}-#{:rand.uniform(69)}"
  end

  @doc """
  Generate a unique app build number.
  """
  def unique_app_build_number do
    System.unique_integer([:positive])
  end

  @doc """
  Generate a unique android version.
  """
  def unique_android_version do
    "android-v#{:rand.uniform(69)}-#{:rand.uniform(69)}-#{:rand.uniform(69)}"
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

  @doc """
  Generate a rating.
  """
  def rating_fixture(attrs \\ %{}) do
    {:ok, rating} =
      attrs
      |> Enum.into(%{
        android_version: unique_android_version(),
        app_build_number: unique_app_build_number(),
        app_version: unique_app_version(),
        app_package: Plexus.AppsFixtures.app_fixture().package,
        rom_name: "Graphene",
        rom_build: "ROMv1",
        installation_source: "fdroid",
        rating_type: :native,
        notes: gnu_linux(),
        score: 2
      })
      |> Plexus.Ratings.create_rating()

    rating
  end
end
