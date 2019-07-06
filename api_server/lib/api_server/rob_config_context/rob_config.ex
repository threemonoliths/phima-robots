defmodule ApiServer.RobConfigContext.RobConfig do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rob_config" do
    field :robnetid, :string
    field :robname, :string
    field :robedition, :string
    timestamps()
  end

  @doc false
  def changeset(rob_config, attrs) do
    rob_config
    |> cast(attrs, [:robnetid, :robname, :robedition])
    |> validate_required([:robnetid])
  end
end
