defmodule ApiServer.RobSystempraContext do
  @moduledoc """
  The RobSystempraContext context.
  """

  import Ecto.Query, warn: false
  alias ApiServer.Repo

  alias ApiServer.RobSystempraContext.RobSystempra
  use ApiServer.BaseContext

  defmacro __using__(_opts) do
    quote do
      import ApiServer.RobSystempraContext
      use ApiServer.BaseContext
      alias ApiServer.RobSystempraContext.RobSystempra
    end
  end

  def page(params) do 
    RobSystempraContext
    |> query_equal(params, "robnetid")
    |> get_pagination(params)
  end
end
