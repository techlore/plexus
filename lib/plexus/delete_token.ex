defmodule Plexus.DeleteToken do
  @moduledoc """
  Generates and verifies delete tokens for anonymous resources.
  """

  @token_size 32

  @spec generate :: {String.t(), binary()}
  def generate do
    token =
      @token_size
      |> :crypto.strong_rand_bytes()
      |> Base.url_encode64(padding: false)

    {token, hash(token)}
  end

  @spec hash(String.t()) :: binary()
  def hash(token) do
    :crypto.hash(:sha256, token)
  end

  @spec valid?(binary(), String.t()) :: boolean()
  def valid?(stored_hash, token) do
    Plug.Crypto.secure_compare(stored_hash, hash(token))
  end
end
