defmodule StoreWeb.CheckoutControllerTest do
  use StoreWeb.ConnCase

  alias StoreCore.{Product, Products}

  @valid_params %{name: "Lapis", price: 150}

  defp fixture(params \\ %{}) do
    {:ok, product} =
      params
      |> Enum.into(@valid_params)
      |> Products.create()

    product
  end

  test "post a simple checkout", %{conn: conn} do
    product = fixture()
    products = [%{"quantity" => 10, "id" => product.id, "price" => 150}]

    conn =
      conn
      |> post(Routes.checkout_path(conn, :create), %{products: products})

    assert %{"total" => 1500, "products" => ^products} = json_response(conn, 202)["data"]
  end

  test "post a simple checkout without a product id", %{conn: conn} do
    product = fixture()
    products = [%{"quantity" => 10, "id" => nil}]

    conn =
      conn
      |> post(Routes.checkout_path(conn, :create), %{products: products})

    assert json_response(conn, 422)["errors"] != []
  end
end
