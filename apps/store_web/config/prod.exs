use Mix.Config

config :store_web, StoreWeb.Endpoint,
  http: [port: System.get_env("PORT")],
  url: [scheme: "https", host: "mysterious-basin-38258.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  secret_key_base: Map.fetch!(System.get_env(), "SECRET_KEY_BASE")

config :logger, level: :info
