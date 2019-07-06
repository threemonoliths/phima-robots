defmodule ApiServer.RobWorklogContext do
  @moduledoc """
  The RobWorklogContext context.
  """

  import Ecto.Query, warn: false
  alias ApiServer.Repo

  alias ApiServer.RobWorklogContext.RobWorklog
  use ApiServer.BaseContext

  defmacro __using__(_opts) do
    quote do
      import ApiServer.RobWorklogContext
      use ApiServer.BaseContext
      alias ApiServer.RobWorklogContext.RobWorklog
    end
  end

  def page(params) do 
    RobWorklogContext
    |> query_equal(params, "robnetid")
    |> get_pagination(params)
  end
end
