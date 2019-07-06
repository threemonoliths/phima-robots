defmodule ApiServerWeb.Router do
  use ApiServerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ApiServerWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    resources "/rob_config", RobConfigController, except: [:new, :edit]
    resources "/rob_systempra", RobSystempraController, except: [:new, :edit]
    resources "/rob_worklog", RobWorklogController, except: [:new, :edit]
  end
end
