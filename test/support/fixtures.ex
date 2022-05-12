defmodule Plexus.Fixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Plexus` context.
  """

  alias Plexus.Schemas.Enums

  def application_fixture(attrs \\ %{}) do
    attrs
    |> Enum.into(%{
      name: "application#{System.unique_integer()}",
      package: "tech.techlore.plexus"
    })
    |> Plexus.Applications.create!()
  end

  def application_rating_fixture(attrs \\ %{}) do
    attrs
    |> Enum.into(%{
      application_version: "42.69.420",
      status: application_rating_status(),
      google_lib: google_lib(),
      rating: Enum.random(1..4),
      notes: gnu_linux()
    })
    |> Plexus.ApplicationRatings.create!()
  end

  defp application_rating_status do
    Enums.ApplicationRatingStatus.values()
    |> Enum.random()
  end

  defp google_lib do
    Enums.GoogleLib.values()
    |> Enum.random()
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
