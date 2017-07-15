defmodule ChickenFingersClub.Article do
  use ChickenFingersClub.Web, :model

  schema "articles" do
    field :title, :string
    field :body, :string
    field :blurg, :string
    field :date, Ecto.Date
    field :photogroup, :string
    field :photo_group, :string
    belongs_to :author, ChickenFingersClub.Author
    belongs_to :restaurant, ChickenFingersClub.Restaurant
    belongs_to :scores, ChickenFingersClub.Scores
    belongs_to :head_photo, ChickenFingersClub.HeadPhoto

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :body, :blurg, :date, :photogroup, :photo_group])
    |> validate_required([:title, :body, :blurg, :date, :photogroup, :photo_group])
  end
end
