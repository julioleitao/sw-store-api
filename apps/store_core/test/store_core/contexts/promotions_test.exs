defmodule StoreCore.PromotionsTest do
  use StoreCore.DataCase

  alias StoreCore.Promotions

  test "list the default promotions" do
    assert length(Promotions.list()) === 2
  end
end
