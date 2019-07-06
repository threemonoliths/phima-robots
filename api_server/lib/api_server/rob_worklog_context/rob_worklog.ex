defmodule ApiServer.RobWorklogContext.RobWorklog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rob_worklog" do
    field :robnetid, :string
    field :event, :string
    field :sequenceid, :string
    field :systime, :string
    timestamps()
  end

  @doc false
  def changeset(rob_worklog, attrs) do
    rob_worklog
    |> cast(attrs, [:robnetid])
    |> validate_required([:robnetid])
  end
end
