defmodule ApiServerWeb.RobConfigControllerTest do
  use ApiServerWeb.ConnCase

  alias ApiServer.RobConfigContext
  alias ApiServer.RobConfigContext.RobConfig

  @create_attrs %{
    robnetid: "some robnetid"
  }
  @update_attrs %{
    robnetid: "some updated robnetid"
  }
  @invalid_attrs %{robnetid: nil}

  def fixture(:rob_config) do
    {:ok, rob_config} = RobConfigContext.create_rob_config(@create_attrs)
    rob_config
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all rob_config", %{conn: conn} do
      conn = get(conn, Routes.rob_config_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create rob_config" do
    test "renders rob_config when data is valid", %{conn: conn} do
      conn = post(conn, Routes.rob_config_path(conn, :create), rob_config: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.rob_config_path(conn, :show, id))

      assert %{
               "id" => id,
               "robnetid" => "some robnetid"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.rob_config_path(conn, :create), rob_config: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update rob_config" do
    setup [:create_rob_config]

    test "renders rob_config when data is valid", %{conn: conn, rob_config: %RobConfig{id: id} = rob_config} do
      conn = put(conn, Routes.rob_config_path(conn, :update, rob_config), rob_config: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.rob_config_path(conn, :show, id))

      assert %{
               "id" => id,
               "robnetid" => "some updated robnetid"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, rob_config: rob_config} do
      conn = put(conn, Routes.rob_config_path(conn, :update, rob_config), rob_config: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete rob_config" do
    setup [:create_rob_config]

    test "deletes chosen rob_config", %{conn: conn, rob_config: rob_config} do
      conn = delete(conn, Routes.rob_config_path(conn, :delete, rob_config))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.rob_config_path(conn, :show, rob_config))
      end
    end
  end

  defp create_rob_config(_) do
    rob_config = fixture(:rob_config)
    {:ok, rob_config: rob_config}
  end
end
