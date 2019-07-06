defmodule ApiServerWeb.RobConfigController do
  use ApiServerWeb, :controller

  use ApiServer.RobConfigContext

  action_fallback ApiServerWeb.FallbackController

  def index(conn, params) do
    page = page(params)
    render(conn, "index.json", page: page)
  end

  def create(conn, %{"rob_config" => rob_config_params}) do
    with {:ok, %RobConfig{} = rob_config} <- save_create(RobConfig.changeset(%RobConfig{}, rob_config_params)) do
      render(conn, "show.json", rob_config: rob_config)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, rob_config} <- get_by_id(RobConfig, id, []) do
      render(conn, "show.json", rob_config: rob_config)
    end
  end

  def update(conn, %{"id" => id, "rob_config" => rob_config_params}) do
    with {:ok, rob_config} <- get_by_id(RobConfig, id, []),
    {:ok, %RobConfig{} = rob_config} <- save_update(RobConfig.changeset(rob_config, rob_config_params)) do
      render(conn, "show.json", rob_config: rob_config)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %RobConfig{} = rob_config} <- delete_by_id(RobConfig, id) do
      render(conn, "show.json", rob_config: rob_config)
    end
  end
end
