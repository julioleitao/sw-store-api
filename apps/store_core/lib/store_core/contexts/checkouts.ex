defmodule StoreCore.Checkouts do
  alias StoreCore.Promotions
  alias StoreCore.Products
  alias StoreCore.CheckoutProduct

  defp to_checkout_products(products) do
    products =
      products
      |> Enum.map(fn params ->
        checkout_product =
          %CheckoutProduct{}
          |> CheckoutProduct.changeset(params)

        if checkout_product.valid?() do
          CheckoutProduct.apply(checkout_product)
        else
          [:errors, checkout_product.errors]
        end
      end)

    errors =
      Enum.filter(products, fn product ->
        case product do
          [:errors, errors] -> errors
          _ -> false
        end
      end)

    if length(errors) != 0 do
      {:errors, errors}
    else
      {:ok, products}
    end
  end

  def retrieve_products(products) do
    products =
      Enum.map(products, fn checkout_product ->
        case Products.get(checkout_product.id) do
          {:ok, product} ->
            Map.put(checkout_product, :price, product.price)

          error ->
            error
        end
      end)

    Enum.filter(products, fn product ->
      case product do
        {:error, reason} -> true
        _ -> false
      end
    end)

    {:ok, products}
  end

  def preview(products) do
    with {:ok, products} <- to_checkout_products(products),
         {:ok, products} <- retrieve_products(products) do
      total =
        products
        |> Enum.reduce(0, fn product, acc ->
          price =
            product
            |> promotion_descount

          acc + price
        end)

      {:ok, [total: total, products: products]}
    end
  end

  defp promotion_descount(product) do
    if (Map.has_key?(product, :promotion_id) and product.promotion_id == nil) or
         not Map.has_key?(product, :promotion_id) do
      product.price * product.quantity
    else
      {:ok, promo} = Promotions.get(product.promotion_id)
      descount_from(product, promo.name)
    end
  end

  def descount_from(%{price: price, quantity: quantity}, "Pague 1 Leve 2") do
    numberOfProductsNotIncluded = rem(quantity, 2)
    quantity = div(quantity - numberOfProductsNotIncluded, 2)
    price * (quantity + numberOfProductsNotIncluded)
  end

  def descount_from(%{price: price, quantity: quantity}, "3 por 10 reais") do
    numberOfProductsNotIncluded = rem(quantity, 3)
    quantity = div(quantity - numberOfProductsNotIncluded, 3)
    1000 * quantity + numberOfProductsNotIncluded * price
  end
end
