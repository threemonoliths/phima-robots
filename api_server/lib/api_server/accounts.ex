defmodule ApiServer.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias ApiServer.Repo

  alias ApiServer.Accounts.User
  use ApiServer.BaseContext

  defmacro __using__(_opts) do
    quote do
      import ApiServer.Accounts
      use ApiServer.BaseContext
      alias ApiServer.Accounts.User
    end
  end

  def page(params) do 
    User
    |> query_like(params, "name")
    |> query_like(params, "full_name")
    |> query_equal(params, "active")
    |> query_equal(params, "is_admin")
    |> query_order_by(params, "inserted_at")
    |> get_pagination(params)
  end

  # 验证通过返回true，否则返回false
  def validate_username(params) do
    params
    |> Map.get("id", nil)
    |> case do
      nil ->
        name = params
        |> Map.get("name")
        case get_by_name(User, name: name) do
          {:ok, _} -> 
            false
          {:error, _} -> 
            true
        end
      id ->
        User
        |> Repo.get(id)
        |> case do
          nil -> false
          entity ->
            name = params
            |> Map.get("name")
            User
            |> query_equal(params, "name")
            |> query_not_equal(params, "id")
            |> Repo.exists?
            |> case do
              true -> 
                false
              false -> 
                true
            end 
            
        end
    end
  end
end
