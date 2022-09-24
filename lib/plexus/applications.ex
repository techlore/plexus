defmodule Plexus.Applications do
  alias Plexus.Repo
  alias Plexus.Schemas.Application

  @spec get_application!(Ecto.UUID.t()) :: Application.t()
  def get_application!(id) do
    Repo.get!(Application, id)
  end

  @spec list_applications(keyword()) :: Repo.page(Application.t())
  def list_applications(opts \\ []) do
    opts = Keyword.take(opts, [:page])
    Repo.paginate(Application, opts)
  end

  @spec create_application!(map()) :: Application.t()
  def create_application!(attrs \\ %{}) do
    %Application{}
    |> Application.changeset(attrs)
    |> Repo.insert!()
  end

  @spec create_application(map()) :: {:ok, Application.t()} | {:error, Ecto.Changeset.t()}
  def create_application(attrs \\ %{}) do
    %Application{}
    |> Application.changeset(attrs)
    |> Repo.insert()
  end

  @spec upsert_application!(map()) :: Application.t()
  def upsert_application!(%{id: application_id} = attrs) do
    application =
      with nil <- Repo.get(Application, application_id) do
        %Application{id: application_id}
      end

    application
    |> Application.changeset(attrs)
    |> Repo.insert_or_update!()
  end
end
