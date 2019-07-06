defmodule ApiServer.Repo.Migrations.CreateRobConfig do
  use Ecto.Migration

  def change do
    create table(:rob_config) do
      add :robnetid, :string
      add :robname, :string
      add :robedition, :string
      timestamps()
    end

  end
end
