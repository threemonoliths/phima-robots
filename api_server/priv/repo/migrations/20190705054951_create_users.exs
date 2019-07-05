defmodule ApiServer.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :mobile, :string
      add :password_hash, :string
      add :full_name, :string
      add :is_admin, :boolean
      add :active, :boolean
      

      timestamps()
    end

  end
end
