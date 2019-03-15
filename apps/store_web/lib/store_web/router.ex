defmodule StoreWeb.Router do
  use StoreWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", StoreWeb do
    pipe_through :api

    resources "/product", ProductController, only: [:create, :show, :update, :delete]
  end
end
