defmodule StoreCore.Promotions do
  alias StoreCore.{Promotion, Repo}

  def list, do: Promotion |> Repo.all()

  def get(id) do
    case Repo.get(Promotion, id) do
      nil -> {:error, :not_found}
      promotion -> {:ok, promotion}
    end
  end

  def filter_by_name(name) do
    [promotion] =
      list()
      |> Enum.filter(fn promotion ->
        promotion.name === name
      end)

    promotion
  end
end
