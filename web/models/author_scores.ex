defmodule ChickenFingersClub.AuthorScores do
  use ChickenFingersClub.Web, :model

  schema "author_scores" do
    field :overall, :float
    field :chicken, :float
    field :breading, :float
    field :crispiness, :float
    field :date, Ecto.Date
    field :author_references_authors, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:overall, :chicken, :breading, :crispiness, :date, :author_references_authors])
    |> validate_required([:overall, :chicken, :breading, :crispiness, :date, :author_references_authors])
  end
end
