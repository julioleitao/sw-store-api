defmodule StoreCore.Promotion do
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "promotions" do
    field :name, :string

    timestamps()
  end

  @required_params [:name]

  def changeset(promotion, params \\ %{}) do
    promotion
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
