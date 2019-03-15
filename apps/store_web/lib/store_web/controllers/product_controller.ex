defmodule StoreWeb.ProductController do
  use StoreWeb, :controller

  alias StoreCore.Products

  action_fallback StoreWeb.FallbackController

  def create(conn, attrs) do
    with {:ok, product} <- Products.create(attrs) do
      conn
      |> put_status(:created)
      |> render("show.json", product: product)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, product} <- Products.get(id) do
      render(conn, "show.json", product: product)
    end
  end

  def update(conn, %{"id" => id} = params) do
    with {:ok, product} <- Products.get(id),
         {:ok, product} <- Products.update(product, params) do
      render(conn, "show.json",product: product)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, product} <- Products.get(id),
         {:ok, _} <- Products.delete(product) do
      send_resp(conn, :no_content, "")
    end
  end
end
