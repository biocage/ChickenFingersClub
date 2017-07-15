defmodule ChickenFingersClub.AuthorScoresTest do
  use ChickenFingersClub.ModelCase

  alias ChickenFingersClub.AuthorScores

  @valid_attrs %{author_references_authors: "some content", breading: "120.5", chicken: "120.5", crispiness: "120.5", date: %{day: 17, month: 4, year: 2010}, overall: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = AuthorScores.changeset(%AuthorScores{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = AuthorScores.changeset(%AuthorScores{}, @invalid_attrs)
    refute changeset.valid?
  end
end
