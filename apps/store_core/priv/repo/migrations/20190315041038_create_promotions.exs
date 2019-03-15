defmodule StoreCore.Repo.Migrations.CreatePromotions do
  use Ecto.Migration

  alias StoreCore.{Promotion, Repo}

  def change do
    create table(:promotions, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false

      timestamps()
    end

    create unique_index(:promotions, [:name])

    flush()

    insert_promotions()

    alter table(:products) do
      add :promotion_id, references(:promotions, type: :uuid), null: true
    end
  end

  defp insert_promotions() do
    ["Pague 1 Leve 2", "3 por 10 reais"]
    |> Enum.map(fn name ->
      %Promotion{name: name}
      |> Promotion.changeset()
      |> Repo.insert()
    end)
  end
end
