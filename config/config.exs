# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mx_tracker,
  ecto_repos: [MxTracker.Repo]

# Configures the endpoint
config :mx_tracker, MxTrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "C4H8B4Dt3vgXql/JZ3ujeiCMHi7lHJ7hWyjm9WF/+23PPAv7k/DnyBMhSIEzf7Ly",
  render_errors: [view: MxTrackerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MxTracker.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
