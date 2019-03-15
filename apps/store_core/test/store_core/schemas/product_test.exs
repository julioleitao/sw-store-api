defmodule StoreCore.ProductTest do
  use ExUnit.Case, async: true

  alias StoreCore.Product

  test "a valid product" do
    product =
      %Product{}
      |> Product.changeset(%{name: "Lápis de cor", price: 600})

    assert product.valid?()
  end

  test "a invalid product" do
    product =
      %Product{}
      |> Product.changeset(%{name: "Lápis de cor"})

    refute product.valid?()

    product =
      %Product{}
      |> Product.changeset(%{price: 800})

    refute product.valid?()
  end
end
