# Since configuration is shared in umbrella projects, this file
# should only configure the :store_core application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

config :store_core,
  ecto_repos: [StoreCore.Repo]

import_config "#{Mix.env()}.exs"
