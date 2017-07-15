defmodule ChickenFingersClub.Repo.Migrations.CreateAuthorScores do
  use Ecto.Migration

  def change do
    create table(:author_scores) do
      add :overall, :float
      add :chicken, :float
      add :breading, :float
      add :crispiness, :float
      add :date, :date
      add :author_references_authors, :string

      timestamps()
    end

  end
end
