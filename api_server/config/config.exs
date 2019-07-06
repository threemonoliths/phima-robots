# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :api_server,
  ecto_repos: [ApiServer.Repo]

# Configures the endpoint
config :api_server, ApiServerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ttpbgpx3Wdvhmhj0BnbX73+OZVJLtY3mBlUlxvbHWK4R8V9dWK56V9383CxaEZM+",
  render_errors: [view: ApiServerWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ApiServer.PubSub, adapter: Phoenix.PubSub.PG2],
  # static resource access url
  base_url: "http://localhost:4000"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :api_server, ApiServerWeb.Guardian,
  issuer: "api_server",
  secret_key: "kbM0z6KphOLVz5ukeaKfw0lMibEdReJNWcG9Qr3ZgJW2sHROqbTQcBZF0xvuFBJY",
  ttl: {1, :day}

# Store uploaded file in local storage
config :arc,
  storage: Arc.Storage.Local

# cors
config :cors_plug,
  origin: ["*"],
  headers: ["*"],
  max_age: 86400,
  methods: ["*"]

# scheduler
config :api_server, ApiServer.Scheduler,
  jobs: [
    # Every minute get rob_worklog
    {"* * * * *",     fn -> ApiServer.SyncWorklog.syn end},
    # Runs every midnight get rob_systempra:
    {"@daily",         fn -> ApiServer.SyncSystempra.syn end}
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
