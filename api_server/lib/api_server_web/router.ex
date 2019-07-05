defmodule ApiServerWeb.Router do
  use ApiServerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ApiServerWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
  end
end
