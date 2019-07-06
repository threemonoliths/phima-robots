defmodule ApiServer.Repo.Migrations.CreateRobWorklog do
  use Ecto.Migration

  def change do
    create table(:rob_worklog) do
      add :robnetid, :string
      add :event, :string
      add :sequenceid, :string
      add :systime, :string
      timestamps()
    end

  end
end
