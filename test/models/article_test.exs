defmodule ChickenFingersClub.ArticleTest do
  use ChickenFingersClub.ModelCase

  alias ChickenFingersClub.Article

  @valid_attrs %{blurg: "some content", body: "some content", date: %{day: 17, month: 4, year: 2010}, photo_group: "some content", photogroup: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Article.changeset(%Article{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Article.changeset(%Article{}, @invalid_attrs)
    refute changeset.valid?
  end
end
