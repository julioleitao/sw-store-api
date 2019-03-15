defmodule StoreWeb.ProductControllerTest do
  use StoreWeb.ConnCase

  @valid_attrs %{
    name: "Lápis de cor",
    price: 100
  }

  @invalid_attrs %{
    name: nil,
    price: nil
  }

  describe "post an product " do
    test "with valid data", %{conn: conn} do
      conn =
        conn
        |> post(Routes.product_path(conn, :create), @valid_attrs)

      assert %{"id" => id} = json_response(conn, 201)["data"]
    end

    test "with invalid data" do
      conn = post(conn, Routes.product_path(conn, :create), @invalid_attrs)

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "get an product" do
    test "that exists", %{conn: conn} do
      product = fixture(conn)

      conn = get(conn, Routes.product_path(conn, :show, product["id"]))

      assert product === json_response(conn, 200)["data"]
    end

    test "that doest not exist" do
      conn = get(conn, Routes.product_path(conn, :show, "016c25fd-70e0-56fe-9d1a-56e80fa20b82"))

      assert json_response(conn, 404)["errors"] != %{}
    end
  end

  describe "update an product with" do
    test "valid data" do
      product = fixture(conn)
      attrs = %{name: "Lápis de cor raiz"}
      product = %{product | "name" => attrs.name}
      conn = put(conn, Routes.product_path(conn, :update, product["id"]), attrs)

      assert product === json_response(conn, 200)["data"]
    end

    test "invalid data" do
      product = fixture(conn)
      attrs = %{name: nil}
      conn = put(conn, Routes.product_path(conn, :update, product["id"]), attrs)

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  test "delete an product", %{conn: conn} do
    product = fixture(conn)

    conn = delete(conn, Routes.product_path(conn, :delete, product["id"]))

    assert response(conn, 204)
  end

  defp fixture(conn, attrs \\ %{}) do
    request_body =
      @valid_attrs
      |> Enum.into(attrs)

    conn = post(conn, Routes.product_path(conn, :create), request_body)

    json_response(conn, 201)["data"]
  end
end
