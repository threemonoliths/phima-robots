defmodule ApiServer.RobWorklogContextTest do
  use ApiServer.DataCase

  alias ApiServer.RobWorklogContext

  describe "rob_worklog" do
    alias ApiServer.RobWorklogContext.RobWorklog

    @valid_attrs %{robnetid: "some robnetid"}
    @update_attrs %{robnetid: "some updated robnetid"}
    @invalid_attrs %{robnetid: nil}

    def rob_worklog_fixture(attrs \\ %{}) do
      {:ok, rob_worklog} =
        attrs
        |> Enum.into(@valid_attrs)
        |> RobWorklogContext.create_rob_worklog()

      rob_worklog
    end

    test "list_rob_worklog/0 returns all rob_worklog" do
      rob_worklog = rob_worklog_fixture()
      assert RobWorklogContext.list_rob_worklog() == [rob_worklog]
    end

    test "get_rob_worklog!/1 returns the rob_worklog with given id" do
      rob_worklog = rob_worklog_fixture()
      assert RobWorklogContext.get_rob_worklog!(rob_worklog.id) == rob_worklog
    end

    test "create_rob_worklog/1 with valid data creates a rob_worklog" do
      assert {:ok, %RobWorklog{} = rob_worklog} = RobWorklogContext.create_rob_worklog(@valid_attrs)
      assert rob_worklog.robnetid == "some robnetid"
    end

    test "create_rob_worklog/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = RobWorklogContext.create_rob_worklog(@invalid_attrs)
    end

    test "update_rob_worklog/2 with valid data updates the rob_worklog" do
      rob_worklog = rob_worklog_fixture()
      assert {:ok, %RobWorklog{} = rob_worklog} = RobWorklogContext.update_rob_worklog(rob_worklog, @update_attrs)
      assert rob_worklog.robnetid == "some updated robnetid"
    end

    test "update_rob_worklog/2 with invalid data returns error changeset" do
      rob_worklog = rob_worklog_fixture()
      assert {:error, %Ecto.Changeset{}} = RobWorklogContext.update_rob_worklog(rob_worklog, @invalid_attrs)
      assert rob_worklog == RobWorklogContext.get_rob_worklog!(rob_worklog.id)
    end

    test "delete_rob_worklog/1 deletes the rob_worklog" do
      rob_worklog = rob_worklog_fixture()
      assert {:ok, %RobWorklog{}} = RobWorklogContext.delete_rob_worklog(rob_worklog)
      assert_raise Ecto.NoResultsError, fn -> RobWorklogContext.get_rob_worklog!(rob_worklog.id) end
    end

    test "change_rob_worklog/1 returns a rob_worklog changeset" do
      rob_worklog = rob_worklog_fixture()
      assert %Ecto.Changeset{} = RobWorklogContext.change_rob_worklog(rob_worklog)
    end
  end
end
