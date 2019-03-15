defmodule StoreCore.Product do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "products" do
    field :name, :string
    field :price, :integer

    timestamps()
  end

  @required_params [:name, :price]

  def changeset(product, params \\ %{}) do
    product
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
