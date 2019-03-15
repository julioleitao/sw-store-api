# Since configuration is shared in umbrella projects, this file
# should only configure the :store_core application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# Configure your database
config :store_core, StoreCore.Repo,
  username: "postgres",
  password: "postgres",
  database: "store_core_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
