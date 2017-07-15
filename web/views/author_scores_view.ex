defmodule ChickenFingersClub.AuthorScoresView do
  use ChickenFingersClub.Web, :view

  def render("index.json", %{author_scores: author_scores}) do
    %{data: render_many(author_scores, ChickenFingersClub.AuthorScoresView, "author_scores.json")}
  end

  def render("show.json", %{author_scores: author_scores}) do
    %{data: render_one(author_scores, ChickenFingersClub.AuthorScoresView, "author_scores.json")}
  end

  def render("author_scores.json", %{author_scores: author_scores}) do
    %{id: author_scores.id,
      overall: author_scores.overall,
      chicken: author_scores.chicken,
      breading: author_scores.breading,
      crispiness: author_scores.crispiness,
      date: author_scores.date,
      author_references_authors: author_scores.author_references_authors}
  end
end
