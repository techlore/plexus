defmodule PlexusWeb.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common data structures and query the data layer.

  Finally, if the test case interacts with the database,
  we enable the SQL sandbox, so changes done to the database
  are reverted at the end of every test. If you are using
  PostgreSQL, you can even run database tests asynchronously
  by setting `use PlexusWeb.ConnCase, async: true`, although
  this option is not recommended for other databases.
  """

  use ExUnit.CaseTemplate

  @salt "device auth"

  using do
    quote do
      # The default endpoint for testing
      @endpoint PlexusWeb.Endpoint

      use PlexusWeb, :verified_routes

      # Import conveniences for testing with connections
      import Plug.Conn
      import Phoenix.ConnTest
      import PlexusWeb.ConnCase
    end
  end

  setup tags do
    Plexus.DataCase.setup_sandbox(tags)
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end

  def setup_json(context) do
    {:ok, conn: Plug.Conn.put_req_header(context.conn, "accept", "application/json")}
  end

  def setup_authenticated_device(context) do
    token =
      Phoenix.Token.sign(PlexusWeb.Endpoint, @salt, %{
        device_id: "device_id",
        email: "user@techlore.tech"
      })

    {:ok, conn: Plug.Conn.put_req_header(context.conn, "authorization", "Bearer " <> token)}
  end
end
