defmodule Plexus.Schemas.Enums.UserRole do
  @user_roles [:admin, :developer]

  @spec values :: [atom()]
  def values, do: @user_roles
end
