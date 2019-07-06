defmodule ApiServerWeb.RobConfigView do
  use ApiServerWeb, :view
  alias ApiServerWeb.RobConfigView

  def render("index.json", %{page: page}) do
    %{
      data: render_many(page.entries, RobConfigView, "rob_config.json"),
      page_number: page.page_number,
      page_size: page.page_size,
      total_entries: page.total_entries,
      total_pages: page.total_pages
    }
  end

  def render("show.json", %{rob_config: rob_config}) do
    %{data: render_one(rob_config, RobConfigView, "rob_config.json")}
  end

  def render("rob_config.json", %{rob_config: rob_config}) do
    rob_config
  end
end
