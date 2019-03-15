defmodule StoreWeb.PromotionController do
  use StoreWeb, :controller

  alias StoreCore.Promotions

  action_fallback StoreWeb.FallbackController

  def index(conn, _) do
    conn
    |> render("index.json", promotions: Promotions.list())
  end
end
