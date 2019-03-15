defmodule StoreCore.Promotions do
  alias StoreCore.{Promotion, Repo}

  def list, do: Promotion |> Repo.all
end
