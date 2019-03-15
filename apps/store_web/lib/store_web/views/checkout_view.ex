defmodule StoreWeb.CheckoutView do
  use StoreWeb, :view

  alias StoreWeb.CheckoutView

  def render("show.json", %{checkout: checkout}) do
    %{data: render_one(checkout, CheckoutView, "checkout.json")}
  end

  def render("checkout.json", %{checkout: [total: total, products: products]}) do
    %{
      total: total,
      products: products_to_view(products)
    }
  end

  defp products_to_view(products) do
    products
    |> Enum.map(fn product ->
      %{
        id: product.id,
        price: product.price,
        quantity: product.quantity
      }
    end)
  end
end
