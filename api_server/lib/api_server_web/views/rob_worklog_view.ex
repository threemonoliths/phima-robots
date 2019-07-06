defmodule ApiServerWeb.RobWorklogView do
  use ApiServerWeb, :view
  alias ApiServerWeb.RobWorklogView

  def render("index.json", %{page: page}) do
    %{
      data: render_many(page.entries, RobWorklogView, "rob_worklog.json"),
      page_number: page.page_number,
      page_size: page.page_size,
      total_entries: page.total_entries,
      total_pages: page.total_pages
    }
  end

  def render("show.json", %{rob_worklog: rob_worklog}) do
    %{data: render_one(rob_worklog, RobWorklogView, "rob_worklog.json")}
  end

  def render("rob_worklog.json", %{rob_worklog: rob_worklog}) do
    rob_worklog
  end
end
