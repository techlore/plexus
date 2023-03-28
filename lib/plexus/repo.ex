defmodule Plexus.Repo do
  use Ecto.Repo, otp_app: :plexus, adapter: Ecto.Adapters.Postgres
  use Scrivener, page_size: 15

  @typedoc """
  What is returned from a `Plexus.Repo.paginate/2` call.

  A Page has 5 fields that can be accessed:

    - entries
    - page_number
    - page_size
    - total_entries
    - total_pages

  """
  @type page(entry) :: Scrivener.Page.t(entry)

  @doc """
  A small wrapper around `Repo.transaction/2'.

  Commits the transaction if the lambda returns `{:ok, result}`, rolling it
  back if the lambda returns `{:error, reason}`. In both cases, the function
  returns the result of the lambda.
  """
  @spec transact((() -> any()), keyword()) :: {:ok, any()} | {:error, any()}
  def transact(fun, opts \\ []) do
    transaction(
      fn ->
        case fun.() do
          {:ok, value} -> value
          :ok -> :transaction_commited
          {:error, reason} -> rollback(reason)
          :error -> rollback(:transaction_rollback_error)
        end
      end,
      opts
    )
  end
end
