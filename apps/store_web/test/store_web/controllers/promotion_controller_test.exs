defmodule StoreWeb.PromotionControllerTest do
  use StoreWeb.ConnCase

  test "get list of promotions", %{conn: conn} do
    conn = get(conn, Routes.promotion_path(conn, :index))
    |> doc(description: "retrieve the promotions available")

    assert [promo_leve_tres, promo_por_dez] = json_response(conn, 200)["data"]
  end
end
