defmodule PlexusWeb.API.V1.RatingView do
  use PlexusWeb, :view

  alias PlexusWeb.API.V1.RatingView

  def render("index.json", %{page: page}) do
    data = render_many(page.entries, RatingView, "rating.json")

    %{
      data: data,
      page_number: page.page_number,
      page_size: page.page_size,
      total_entries: page.total_entries,
      total_pages: page.total_pages
    }
  end

  def render("show.json", %{rating: rating}) do
    data = render_one(rating, RatingView, "rating.json")
    %{data: data}
  end

  def render("rating.json", %{rating: rating}) do
    %{
      id: rating.id,
      application_version: rating.application_version,
      application_build_number: rating.application_build_number,
      status: rating.status,
      google_lib: rating.google_lib,
      rating: rating.rating,
      notes: rating.notes
    }
  end
end
