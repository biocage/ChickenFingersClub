defmodule ChickenFingersClub.Photo do
  use ChickenFingersClub.Web, :model

  schema "photos" do
    field :title, :string
    field :group, :string
    field :url, :string
    field :x, :integer
    field :y, :integer
    field :disk_size, :float

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :group, :url, :x, :y, :disk_size])
    |> validate_required([:title, :group, :url, :x, :y, :disk_size])
  end
end
