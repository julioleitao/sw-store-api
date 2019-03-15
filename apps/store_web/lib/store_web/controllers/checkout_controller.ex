defmodule StoreWeb.CheckoutController do
  use StoreWeb, :controller

  alias StoreCore.Checkouts

  action_fallback StoreWeb.FallbackController

  def create(conn, %{"products" => products}) do
    products = Enum.map(products, &convert_to_atom(&1))

    with {:ok, checkout} <- Checkouts.preview(products) do
      conn
      |> put_status(:accepted)
      |> render("show.json", checkout: checkout)
    end
  end

  defp convert_to_atom(map) do
    for {key, val} <- map, into: %{}, do: {String.to_atom(key), val}
  end
end
