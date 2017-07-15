defmodule ChickenFingersClub.RestaurantTest do
  use ChickenFingersClub.ModelCase

  alias ChickenFingersClub.Restaurant

  @valid_attrs %{alt: "120.5", lat: "120.5", lon: "120.5", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Restaurant.changeset(%Restaurant{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Restaurant.changeset(%Restaurant{}, @invalid_attrs)
    refute changeset.valid?
  end
end
