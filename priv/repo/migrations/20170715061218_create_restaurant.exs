defmodule ChickenFingersClub.Repo.Migrations.CreateRestaurant do
  use Ecto.Migration

  def change do
    create table(:restaurants) do
      add :name, :string
      add :lat, :float
      add :lon, :float
      add :alt, :float
      add :scores, references(:author_scores, on_delete: :nothing)

      timestamps()
    end
    create index(:restaurants, [:scores])

  end
end
