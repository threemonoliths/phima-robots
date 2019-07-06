defmodule ApiServerWeb.RobSystempraView do
  use ApiServerWeb, :view
  alias ApiServerWeb.RobSystempraView

  def render("index.json", %{page: page}) do
    %{
      data: render_many(page.entries, RobSystempraView, "rob_systempra.json"),
      page_number: page.page_number,
      page_size: page.page_size,
      total_entries: page.total_entries,
      total_pages: page.total_pages
    }
  end

  def render("show.json", %{rob_systempra: rob_systempra}) do
    %{data: render_one(rob_systempra, RobSystempraView, "rob_systempra.json")}
  end

  def render("rob_systempra.json", %{rob_systempra: rob_systempra}) do
    rob_systempra
  end
end
