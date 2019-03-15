defmodule StoreWeb.PromotionView do
  use StoreWeb, :view

  alias StoreWeb.PromotionView

  def render("index.json", %{promotions: promotions}) do
    %{data: render_many(promotions, PromotionView, "promotion.json")}
  end

  def render("promotion.json", %{promotion: promotion}) do
    %{
      id: promotion.id,
      name: promotion.name
    }
  end
end
