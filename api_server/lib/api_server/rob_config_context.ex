defmodule ApiServer.RobConfigContext do
  @moduledoc """
  The RobConfigContext context.
  """

  import Ecto.Query, warn: false
  alias ApiServer.Repo

  alias ApiServer.RobConfigContext.RobConfig
  use ApiServer.BaseContext

  defmacro __using__(_opts) do
    quote do
      import ApiServer.RobConfigContext
      use ApiServer.BaseContext
      alias ApiServer.RobConfigContext.RobConfig
    end
  end

  def page(params) do 
    RobConfigContext
    |> query_like(params, "robnetid")
    |> query_like(params, "robname")
    |> get_pagination(params)
  end

end
