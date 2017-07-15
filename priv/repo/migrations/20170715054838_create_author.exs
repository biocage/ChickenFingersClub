defmodule ChickenFingersClub.Repo.Migrations.CreateAuthor do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :first_name, :string
      add :last_name, :string
      add :sudo_name, :string

      timestamps()
    end

  end
end
