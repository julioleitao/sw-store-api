defmodule StoreCore.Products do
  @moduledoc """
  The Products context provides the business
  layer for the app.
  """
  alias StoreCore.{Product, Repo}

  def list, do: Repo.all(Product)

  def create(params) do
    %Product{}
    |> Product.changeset(params)
    |> Repo.insert()
  end

  def get(id) do
    case Repo.get(Product, id) do
      nil -> {:error, :not_found}
      product -> {:ok, product}
    end
  end

  def update(product, params) do
    product
    |> Product.changeset(params)
    |> Repo.update()
  end

  def delete(product), do: Repo.delete(product)
end
