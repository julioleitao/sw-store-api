defmodule StoreCore.CheckoutProduct do
  use Ecto.Schema

  import Ecto.Changeset

  embedded_schema do
    field :quantity, :integer
    field :promotion_id, Ecto.UUID
  end

  @required [:id, :quantity]
  @accepted [:promotion_id | @required]

  def changeset(checkout_product, params \\ %{}) do
    checkout_product
    |> cast(params, @accepted)
    |> validate_required(@required)
  end

  def apply(changeset), do: apply_changes(changeset)
end
