# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :toyota,
  ecto_repos: [Toyota.Repo]

# Configures the endpoint
config :toyota, ToyotaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "iRthUD50ywmwLKyOVKuXrcCuq3IaLJxIDclKOIAjsARg25bUBNF3RetMvfj7zk6u",
  render_errors: [view: ToyotaWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Toyota.PubSub,
           adapter: Phoenix.PubSub.PG2]
#Guardian config
config :toyota, Toyota.Guardian,
  issuer: "toyota",
  secret_key: "sy/KaqbD9ZbZVr8YlB9c/Mjn/PvVc5w0hYS2QM6BSFbMX8aAcB8+pzXPYqul7XPf",
    # optional
  verify_module: Guardian.JWT,
  issuer: "Toyota",
  ttl: {30, :days},
  allowed_drift: 2000
# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
