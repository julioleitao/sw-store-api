defmodule StoreWeb.Router do
  use StoreWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", StoreWeb do
    pipe_through :api
  end
end
