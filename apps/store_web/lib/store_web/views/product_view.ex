defmodule StoreWeb.ProductView do
  use StoreWeb, :view

  alias StoreWeb.ProductView

  def render("show.json", %{product: product}) do
    %{data: render_one(product, ProductView, "product.json")}
  end

  def render("product.json", %{product: product}) do
    %{
      id: product.id,
      name: product.name,
      price: product.price
    }
  end
end