defmodule StoreCore.Product do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "products" do
    field :name, :string
    field :price, :integer
    field :promotion_id, Ecto.UUID

    timestamps()
  end

  @required_params [:name, :price]
  @accepted_params [:promotion_id | @required_params]

  def changeset(product, params \\ %{}) do
    product
    |> cast(params, @accepted_params)
    |> validate_required(@required_params)
  end
end
