defmodule StoreCore.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, null: false
      add :price, :integer, null: false, default: 0

      timestamps()
    end
  end
end
