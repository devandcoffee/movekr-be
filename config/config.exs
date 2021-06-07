# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :movekr,
  ecto_repos: [Movekr.Repo]

# Configures the endpoint
config :movekr, MovekrWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qPpnbcj6+Q9ITdS0JbkK0wTqNBIJmzKRivDiN8CLE3YQmY/Y4nI0MzsEKiNacWa1",
  render_errors: [view: MovekrWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Movekr.PubSub,
  live_view: [signing_salt: "jMIR2gmR"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
