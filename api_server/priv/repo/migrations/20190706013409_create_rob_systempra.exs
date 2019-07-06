defmodule ApiServer.Repo.Migrations.CreateRobSystempra do
  use Ecto.Migration

  def change do
    create table(:rob_systempra) do
      add :robnetid, :string
      add :systempra, :string
      timestamps()
    end

  end
end
