defmodule ApiServerWeb.RobWorklogControllerTest do
  use ApiServerWeb.ConnCase

  alias ApiServer.RobWorklogContext
  alias ApiServer.RobWorklogContext.RobWorklog

  @create_attrs %{
    robnetid: "some robnetid"
  }
  @update_attrs %{
    robnetid: "some updated robnetid"
  }
  @invalid_attrs %{robnetid: nil}

  def fixture(:rob_worklog) do
    {:ok, rob_worklog} = RobWorklogContext.create_rob_worklog(@create_attrs)
    rob_worklog
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all rob_worklog", %{conn: conn} do
      conn = get(conn, Routes.rob_worklog_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create rob_worklog" do
    test "renders rob_worklog when data is valid", %{conn: conn} do
      conn = post(conn, Routes.rob_worklog_path(conn, :create), rob_worklog: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.rob_worklog_path(conn, :show, id))

      assert %{
               "id" => id,
               "robnetid" => "some robnetid"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.rob_worklog_path(conn, :create), rob_worklog: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update rob_worklog" do
    setup [:create_rob_worklog]

    test "renders rob_worklog when data is valid", %{conn: conn, rob_worklog: %RobWorklog{id: id} = rob_worklog} do
      conn = put(conn, Routes.rob_worklog_path(conn, :update, rob_worklog), rob_worklog: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.rob_worklog_path(conn, :show, id))

      assert %{
               "id" => id,
               "robnetid" => "some updated robnetid"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, rob_worklog: rob_worklog} do
      conn = put(conn, Routes.rob_worklog_path(conn, :update, rob_worklog), rob_worklog: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete rob_worklog" do
    setup [:create_rob_worklog]

    test "deletes chosen rob_worklog", %{conn: conn, rob_worklog: rob_worklog} do
      conn = delete(conn, Routes.rob_worklog_path(conn, :delete, rob_worklog))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.rob_worklog_path(conn, :show, rob_worklog))
      end
    end
  end

  defp create_rob_worklog(_) do
    rob_worklog = fixture(:rob_worklog)
    {:ok, rob_worklog: rob_worklog}
  end
end
