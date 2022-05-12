defmodule Plexus.ApplicationRatingsTest do
  use Plexus.DataCase, async: true

  alias Plexus.ApplicationRatings
  alias Plexus.Schemas.ApplicationRating

  import Plexus.Fixtures

  describe "create/1" do
    test "with invalid data returns error changeset" do
      invalid_attrs = %{
        application_id: nil,
        application_version: nil,
        status: nil,
        google_lib: nil,
        rating: 69
      }

      assert {:error, %Ecto.Changeset{}} = ApplicationRatings.create(invalid_attrs)
    end

    test "with valid data creates an application_rating" do
      application = application_fixture()

      valid_attrs = %{
        application_id: application.id,
        application_version: "42.69.420",
        status: :approved,
        google_lib: :micro_g,
        rating: 4,
        notes: "vim > emacs"
      }

      assert {:ok, %ApplicationRating{} = application_rating} =
               ApplicationRatings.create(valid_attrs)

      assert application_rating.application_id == application.id
      assert application_rating.application_version == "42.69.420"
      assert application_rating.application_version_major == 42
      assert application_rating.application_version_minor == 69
      assert application_rating.application_version_patch == 420
      assert application_rating.status == :approved
      assert application_rating.google_lib == :micro_g
      assert application_rating.rating == 4
      assert application_rating.notes == "vim > emacs"
    end
  end
end
