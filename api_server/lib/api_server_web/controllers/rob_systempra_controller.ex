defmodule ApiServerWeb.RobSystempraController do
  use ApiServerWeb, :controller

  use ApiServer.RobSystempraContext

  action_fallback ApiServerWeb.FallbackController

  def index(conn, params) do
    page = page(params)
    render(conn, "index.json", page: page)
  end

  def show(conn, %{"id" => id}) do
    with {:ok, rob_systempra} <- get_by_id(RobSystempra, id, []) do
      render(conn, "show.json", rob_systempra: rob_systempra)
    end
  end

end
