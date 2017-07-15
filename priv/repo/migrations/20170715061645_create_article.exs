defmodule ChickenFingersClub.Repo.Migrations.CreateArticle do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string
      add :body, :string
      add :blurg, :string
      add :date, :date
      add :photogroup, :string
      add :photo_group, :string
      add :author, references(:authors, on_delete: :nothing)
      add :restaurant, references(:restaurants, on_delete: :nothing)
      add :scores, references(:author_scores, on_delete: :nothing)
      add :head_photo, references(:photos, on_delete: :nothing)

      timestamps()
    end
    create index(:articles, [:author])
    create index(:articles, [:restaurant])
    create index(:articles, [:scores])
    create index(:articles, [:head_photo])

  end
end
