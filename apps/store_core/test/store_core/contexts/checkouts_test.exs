defmodule StoreCore.CheckoutsTest do
  use StoreCore.DataCase

  alias StoreCore.{Checkouts, Product, Products, Promotions}

  test "calculate a checkout without promo code" do
    products =
      [
        %{name: "Lápis", price: 200, quantity: 1},
        %{name: "Borracha", price: 100, quantity: 1}
      ]
      |> Enum.map(fn product ->
        {:ok, created_product} = Products.create(product)

        product = %{product | name: nil}
        product = %{product | price: nil}
        Map.put(product, :id, created_product.id)
      end)

    assert [total: 300, products: ^products] = Checkouts.preview(products)
  end

  describe "calculate Pague 1 Leve 2 with" do
    test "with one group" do
      total =
        [
          %{name: "Lápis", price: 200, quantity: 2, promotion_id: pague_1_leve_2()},
          %{name: "Borracha", price: 100, quantity: 1}
        ]
        |> checkout_total

      assert total === 300
    end

    test "with one group and one out from promotion" do
      total =
        [
          %{name: "Lápis", price: 200, quantity: 3, promotion_id: pague_1_leve_2()},
          %{name: "Borracha", price: 100, quantity: 1}
        ]
        |> checkout_total

      assert total === 500
    end

    test "with many groups" do
      total =
        [
          %{name: "Lápis", price: 200, quantity: 7, promotion_id: pague_1_leve_2()},
          %{name: "Borracha", price: 150, quantity: 3, promotion_id: pague_1_leve_2()}
        ]
        |> checkout_total

      assert total === 1100
    end
  end

  describe "calculate 3 por 10 reais with" do
    test "with one group" do
      total =
        [%{name: "Lápis", price: 200, quantity: 3, promotion_id: tres_por_10()}]
        |> checkout_total

      assert total === 10
    end

    test "with two groups" do
      total =
        [%{name: "Lápis", price: 200, quantity: 6, promotion_id: tres_por_10()}]
        |> checkout_total

      assert total === 20
    end

    test "with two groups and one out from promotion" do
      total =
        [%{name: "Lápis", price: 200, quantity: 7, promotion_id: tres_por_10()}]
        |> checkout_total

      assert total === 220
    end
  end

  test "a mixed checkout" do
    total =
      [
        # 700
        %{name: "Ponta de lápis", price: 100, quantity: 7},
        # 30
        %{name: "Caixa de lápis", price: 650, quantity: 9, promotion_id: tres_por_10()},
        # 300
        %{name: "Borracha", price: 75, quantity: 7, promotion_id: pague_1_leve_2()},
        # 320
        %{name: "Pasta colegial", price: 300, quantity: 7, promotion_id: tres_por_10()},
        # 200
        %{name: "Caneta", price: 100, quantity: 3, promotion_id: pague_1_leve_2()},
        # 1400
        %{name: "Lápis", price: 200, quantity: 7}
      ]
      |> checkout_total

    assert total === 700 + 30 + 300 + 320 + 200 + 1400
  end

  defp tres_por_10, do: Promotions.filter_by_name("3 por 10 reais").id

  defp pague_1_leve_2, do: Promotions.filter_by_name("Pague 1 Leve 2").id

  defp checkout_total(products) do
    [total: total, products: _] =
      products
      |> Enum.map(fn product ->
        {:ok, created_product} = Products.create(product)
        # ensure that the price it is retrieved from the backend
        product = %{product | name: nil}
        product = %{product | price: nil}
        Map.put(product, :id, created_product.id)
      end)
      |> Checkouts.preview()

    total
  end
end
