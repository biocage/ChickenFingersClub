defmodule ChickenFingersClub.AuthorView do
  use ChickenFingersClub.Web, :view

  def render("index.json", %{authors: authors}) do
    %{data: render_many(authors, ChickenFingersClub.AuthorView, "author.json")}
  end

  def render("show.json", %{author: author}) do
    %{data: render_one(author, ChickenFingersClub.AuthorView, "author.json")}
  end

  def render("author.json", %{author: author}) do
    %{id: author.id,
      first_name: author.first_name,
      last_name: author.last_name,
      sudo_name: author.sudo_name}
  end
end
