defmodule ChickenFingersClub.Restaurant do
  use ChickenFingersClub.Web, :model

  schema "restaurants" do
    field :name, :string
    field :lat, :float
    field :lon, :float
    field :alt, :float
    belongs_to :scores, ChickenFingersClub.Scores

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :lat, :lon, :alt])
    |> validate_required([:name, :lat, :lon, :alt])
  end
end
