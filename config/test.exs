use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :mx_tracker, MxTrackerWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :mx_tracker, MxTracker.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "maxgronlund",
  password: "",
  database: "mx_tracker_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Configure your database
# config :mx_tracker, MxTracker.Repo,
#   adapter: Ecto.Adapters.Postgres,
#   username: "maxgronlund",
#   password: "",
#   database: "mx_tracker_test",
#   hostname: "localhost",
#   pool_size: 10
