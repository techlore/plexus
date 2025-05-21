defmodule PlexusWeb.SitemapController do
  use PlexusWeb, :controller

  def index(conn, _params) do
    conn
    |> put_resp_content_type("text/xml")
    |> put_layout(false)
    |> render("sitemap.xml", routes: routes())
  end

  defp routes do
    base_url = PlexusWeb.Endpoint.url()

    PlexusWeb.Router
    |> Phoenix.Router.routes()
    |> Enum.reduce([], fn
      %{verb: :get, path: path}, acc ->
        if String.starts_with?(path, "/admin") or
             String.starts_with?(path, "/api") or
             String.contains?(path, ":") or
             String.ends_with?(path, ".xml") do
          acc
        else
          [build_route(base_url, path) | acc]
        end

      _route, acc ->
        acc
    end)
  end

  defp build_route(base_url, path) do
    %{
      path: full_path(base_url, path),
      priority: priority(path),
      change_freq: change_freq(path),
      last_mod: last_mod(path)
    }
  end

  defp full_path(base_url, path) do
    path =
      case path do
        "/" -> "/"
        path -> path <> "/"
      end

    base_url
    |> URI.new!()
    |> URI.append_path(path)
    |> URI.to_string()
  end

  defp priority("/"), do: 1.0
  defp priority(_path), do: 0.5

  defp change_freq("/swaggerui"), do: "yearly"
  defp change_freq(_), do: "weekly"

  defp last_mod(path) when path in ["/", "/apps"] do
    Plexus.Apps.fetch_most_recently_added_app!()
    |> Map.fetch!(:inserted_at)
    |> DateTime.to_date()
  end

  defp last_mod(_), do: false
end
