defmodule ApiServer.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :mobile, :string
    field :password, :string, virtual: true, default: "p@ssw0rd"
    field :password_hash, :string
    field :full_name, :string, default: ""
    field :is_admin, :boolean, default: false
    field :active, :boolean, default: false
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :mobile, :password, :full_name, :is_admin, :active])
    |> validate_required([:name])
    |> put_password_hash()
  end

  @doc false
  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Comeonin.Pbkdf2.hashpwsalt(password))
      _ ->
        changeset
    end
  end
end
