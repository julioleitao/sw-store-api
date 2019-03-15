# Since configuration is shared in umbrella projects, this file
# should only configure the :store_core application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# Configure your database
config :store_core, StoreCore.Repo,
  url:
    System.get_env("DATABASE_URL") ||
      "postgresql://sw_store_usr:sw_store_pwd@localhost/sw_store_test",
  pool: Ecto.Adapters.SQL.Sandbox
