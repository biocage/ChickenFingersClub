defmodule ChickenFingersClub.ArticleView do
  use ChickenFingersClub.Web, :view

  def render("index.json", %{articles: articles}) do
    %{data: render_many(articles, ChickenFingersClub.ArticleView, "article.json")}
  end

  def render("show.json", %{article: article}) do
    %{data: render_one(article, ChickenFingersClub.ArticleView, "article.json")}
  end

  def render("article.json", %{article: article}) do
    %{id: article.id,
      title: article.title,
      body: article.body,
      blurg: article.blurg,
      date: article.date,
      photogroup: article.photogroup,
      author: article.author,
      restaurant: article.restaurant,
      scores: article.scores,
      head_photo: article.head_photo,
      photo_group: article.photo_group}
  end
end
