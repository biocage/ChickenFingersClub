defmodule ChickenFingersClub.Repo.Migrations.CreatePhoto do
  use Ecto.Migration

  def change do
    create table(:photos) do
      add :title, :string
      add :group, :string
      add :url, :string
      add :x, :integer
      add :y, :integer
      add :disk_size, :float

      timestamps()
    end

  end
end
