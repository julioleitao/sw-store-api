defmodule StoreCore.Repo do
  use Ecto.Repo,
    otp_app: :store_core,
    adapter: Ecto.Adapters.Postgres
end
