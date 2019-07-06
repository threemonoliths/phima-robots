defmodule ApiServer.RobSystempraContext.RobSystempra do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rob_systempra" do
    field :robnetid, :string
    field :systempra, :string
    timestamps()
  end

  @doc false
  def changeset(rob_systempra, attrs) do
    rob_systempra
    |> cast(attrs, [:robnetid, :systempra])
    |> validate_required([:robnetid])
  end
end
