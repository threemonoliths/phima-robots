defmodule ApiServerWeb.RobSystempraControllerTest do
  use ApiServerWeb.ConnCase

  alias ApiServer.RobSystempraContext
  alias ApiServer.RobSystempraContext.RobSystempra

  @create_attrs %{
    robnetid: "some robnetid"
  }
  @update_attrs %{
    robnetid: "some updated robnetid"
  }
  @invalid_attrs %{robnetid: nil}

  def fixture(:rob_systempra) do
    {:ok, rob_systempra} = RobSystempraContext.create_rob_systempra(@create_attrs)
    rob_systempra
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all rob_systempra", %{conn: conn} do
      conn = get(conn, Routes.rob_systempra_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create rob_systempra" do
    test "renders rob_systempra when data is valid", %{conn: conn} do
      conn = post(conn, Routes.rob_systempra_path(conn, :create), rob_systempra: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.rob_systempra_path(conn, :show, id))

      assert %{
               "id" => id,
               "robnetid" => "some robnetid"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.rob_systempra_path(conn, :create), rob_systempra: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update rob_systempra" do
    setup [:create_rob_systempra]

    test "renders rob_systempra when data is valid", %{conn: conn, rob_systempra: %RobSystempra{id: id} = rob_systempra} do
      conn = put(conn, Routes.rob_systempra_path(conn, :update, rob_systempra), rob_systempra: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.rob_systempra_path(conn, :show, id))

      assert %{
               "id" => id,
               "robnetid" => "some updated robnetid"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, rob_systempra: rob_systempra} do
      conn = put(conn, Routes.rob_systempra_path(conn, :update, rob_systempra), rob_systempra: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete rob_systempra" do
    setup [:create_rob_systempra]

    test "deletes chosen rob_systempra", %{conn: conn, rob_systempra: rob_systempra} do
      conn = delete(conn, Routes.rob_systempra_path(conn, :delete, rob_systempra))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.rob_systempra_path(conn, :show, rob_systempra))
      end
    end
  end

  defp create_rob_systempra(_) do
    rob_systempra = fixture(:rob_systempra)
    {:ok, rob_systempra: rob_systempra}
  end
end
