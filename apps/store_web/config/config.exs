# Since configuration is shared in umbrella projects, this file
# should only configure the :store_web application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# General application configuration
config :store_web,
  generators: [context_app: false]

# Configures the endpoint
config :store_web, StoreWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SQASLNOYJRMpv/bt8ZyhNAT8fbp3fa8tzQIRa9cegzHjNpIOByKT9b3fZAM+EqrU",
  render_errors: [view: StoreWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: StoreWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
