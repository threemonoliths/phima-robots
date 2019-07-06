defmodule ApiServerWeb.RobWorklogController do
  use ApiServerWeb, :controller

  use ApiServer.RobWorklogContext


  action_fallback ApiServerWeb.FallbackController

  def index(conn, params) do
    page = page(params)
    render(conn, "index.json", page: page)
  end

  def show(conn, %{"id" => id}) do
    with {:ok, rob_worklog} <- get_by_id(RobWorklog, id, []) do
      render(conn, "show.json", rob_worklog: rob_worklog)
    end
  end

end
