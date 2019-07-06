defmodule ApiServer.RobConfigContextTest do
  use ApiServer.DataCase

  alias ApiServer.RobConfigContext

  describe "rob_config" do
    alias ApiServer.RobConfigContext.RobConfig

    @valid_attrs %{robnetid: "some robnetid"}
    @update_attrs %{robnetid: "some updated robnetid"}
    @invalid_attrs %{robnetid: nil}

    def rob_config_fixture(attrs \\ %{}) do
      {:ok, rob_config} =
        attrs
        |> Enum.into(@valid_attrs)
        |> RobConfigContext.create_rob_config()

      rob_config
    end

    test "list_rob_config/0 returns all rob_config" do
      rob_config = rob_config_fixture()
      assert RobConfigContext.list_rob_config() == [rob_config]
    end

    test "get_rob_config!/1 returns the rob_config with given id" do
      rob_config = rob_config_fixture()
      assert RobConfigContext.get_rob_config!(rob_config.id) == rob_config
    end

    test "create_rob_config/1 with valid data creates a rob_config" do
      assert {:ok, %RobConfig{} = rob_config} = RobConfigContext.create_rob_config(@valid_attrs)
      assert rob_config.robnetid == "some robnetid"
    end

    test "create_rob_config/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = RobConfigContext.create_rob_config(@invalid_attrs)
    end

    test "update_rob_config/2 with valid data updates the rob_config" do
      rob_config = rob_config_fixture()
      assert {:ok, %RobConfig{} = rob_config} = RobConfigContext.update_rob_config(rob_config, @update_attrs)
      assert rob_config.robnetid == "some updated robnetid"
    end

    test "update_rob_config/2 with invalid data returns error changeset" do
      rob_config = rob_config_fixture()
      assert {:error, %Ecto.Changeset{}} = RobConfigContext.update_rob_config(rob_config, @invalid_attrs)
      assert rob_config == RobConfigContext.get_rob_config!(rob_config.id)
    end

    test "delete_rob_config/1 deletes the rob_config" do
      rob_config = rob_config_fixture()
      assert {:ok, %RobConfig{}} = RobConfigContext.delete_rob_config(rob_config)
      assert_raise Ecto.NoResultsError, fn -> RobConfigContext.get_rob_config!(rob_config.id) end
    end

    test "change_rob_config/1 returns a rob_config changeset" do
      rob_config = rob_config_fixture()
      assert %Ecto.Changeset{} = RobConfigContext.change_rob_config(rob_config)
    end
  end
end
