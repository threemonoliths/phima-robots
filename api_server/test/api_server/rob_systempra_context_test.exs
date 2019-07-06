defmodule ApiServer.RobSystempraContextTest do
  use ApiServer.DataCase

  alias ApiServer.RobSystempraContext

  describe "rob_systempra" do
    alias ApiServer.RobSystempraContext.RobSystempra

    @valid_attrs %{robnetid: "some robnetid"}
    @update_attrs %{robnetid: "some updated robnetid"}
    @invalid_attrs %{robnetid: nil}

    def rob_systempra_fixture(attrs \\ %{}) do
      {:ok, rob_systempra} =
        attrs
        |> Enum.into(@valid_attrs)
        |> RobSystempraContext.create_rob_systempra()

      rob_systempra
    end

    test "list_rob_systempra/0 returns all rob_systempra" do
      rob_systempra = rob_systempra_fixture()
      assert RobSystempraContext.list_rob_systempra() == [rob_systempra]
    end

    test "get_rob_systempra!/1 returns the rob_systempra with given id" do
      rob_systempra = rob_systempra_fixture()
      assert RobSystempraContext.get_rob_systempra!(rob_systempra.id) == rob_systempra
    end

    test "create_rob_systempra/1 with valid data creates a rob_systempra" do
      assert {:ok, %RobSystempra{} = rob_systempra} = RobSystempraContext.create_rob_systempra(@valid_attrs)
      assert rob_systempra.robnetid == "some robnetid"
    end

    test "create_rob_systempra/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = RobSystempraContext.create_rob_systempra(@invalid_attrs)
    end

    test "update_rob_systempra/2 with valid data updates the rob_systempra" do
      rob_systempra = rob_systempra_fixture()
      assert {:ok, %RobSystempra{} = rob_systempra} = RobSystempraContext.update_rob_systempra(rob_systempra, @update_attrs)
      assert rob_systempra.robnetid == "some updated robnetid"
    end

    test "update_rob_systempra/2 with invalid data returns error changeset" do
      rob_systempra = rob_systempra_fixture()
      assert {:error, %Ecto.Changeset{}} = RobSystempraContext.update_rob_systempra(rob_systempra, @invalid_attrs)
      assert rob_systempra == RobSystempraContext.get_rob_systempra!(rob_systempra.id)
    end

    test "delete_rob_systempra/1 deletes the rob_systempra" do
      rob_systempra = rob_systempra_fixture()
      assert {:ok, %RobSystempra{}} = RobSystempraContext.delete_rob_systempra(rob_systempra)
      assert_raise Ecto.NoResultsError, fn -> RobSystempraContext.get_rob_systempra!(rob_systempra.id) end
    end

    test "change_rob_systempra/1 returns a rob_systempra changeset" do
      rob_systempra = rob_systempra_fixture()
      assert %Ecto.Changeset{} = RobSystempraContext.change_rob_systempra(rob_systempra)
    end
  end
end
