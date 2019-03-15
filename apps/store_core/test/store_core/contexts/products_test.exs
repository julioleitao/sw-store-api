defmodule StoreCore.ProductsTest do
  use StoreCore.DataCase

  alias StoreCore.{
    Product,
    Products
  }

  @valid_params %{
    name: "Lápis de cor",
    price: 600
  }

  @invalid_params %{
    name: nil,
    price: nil
  }

  test "create a Product" do
    assert %{id: id} = fixture()
  end

  test "create a Product with invalid data" do
    assert {:error, %Ecto.Changeset{}} = Products.create(@invalid_params)
  end

  test "retrieve a Product" do
    product = fixture()

    assert {:ok, product} === Products.get(product.id)
  end

  test "update a Product" do
    product = fixture()

    assert {:ok, product} = Products.update(product, %{name: "Lápis de cor raiz"})
  end

  test "update a Product with invalid data" do
    product = fixture()

    assert {:error, %Ecto.Changeset{}} = Products.update(product, @invalid_params)
  end

  test "delete a Product" do
    product = fixture()

    assert {:ok, %Product{}} = Products.delete(product)
    assert {:error, :not_found} === Products.get(product.id)
  end

  defp fixture(params \\ %{}) do
    {:ok, product} =
      %{}
      |> Enum.into(@valid_params)
      |> Enum.into(params)
      |> Products.create()

    product
  end
end
