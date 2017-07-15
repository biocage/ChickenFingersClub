defmodule ChickenFingersClub.PhotoTest do
  use ChickenFingersClub.ModelCase

  alias ChickenFingersClub.Photo

  @valid_attrs %{disk_size: "120.5", group: "some content", title: "some content", url: "some content", x: 42, y: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Photo.changeset(%Photo{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Photo.changeset(%Photo{}, @invalid_attrs)
    refute changeset.valid?
  end
end
