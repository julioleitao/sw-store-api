defmodule StoreCore.PromotionsTest do
  use StoreCore.DataCase

  alias StoreCore.Promotions

  test "list the default promotions" do
    assert length(Promotions.list()) === 2
  end

  test "filter by name" do
    name = "Pague 1 Leve 2"
    promotion = Promotions.filter_by_name(name)

    assert %{id: id, name: ^name} = promotion
    assert promotion = Promotions.get(id)
  end
end
