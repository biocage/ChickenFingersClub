defmodule ChickenFingersClub.AuthorScoresController do
  use ChickenFingersClub.Web, :controller

  alias ChickenFingersClub.AuthorScores

  def index(conn, _params) do
    author_scores = Repo.all(AuthorScores)
    render(conn, "index.json", author_scores: author_scores)
  end

  def create(conn, %{"author_scores" => author_scores_params}) do
    changeset = AuthorScores.changeset(%AuthorScores{}, author_scores_params)

    case Repo.insert(changeset) do
      {:ok, author_scores} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", author_scores_path(conn, :show, author_scores))
        |> render("show.json", author_scores: author_scores)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ChickenFingersClub.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    author_scores = Repo.get!(AuthorScores, id)
    render(conn, "show.json", author_scores: author_scores)
  end

  def update(conn, %{"id" => id, "author_scores" => author_scores_params}) do
    author_scores = Repo.get!(AuthorScores, id)
    changeset = AuthorScores.changeset(author_scores, author_scores_params)

    case Repo.update(changeset) do
      {:ok, author_scores} ->
        render(conn, "show.json", author_scores: author_scores)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ChickenFingersClub.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    author_scores = Repo.get!(AuthorScores, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(author_scores)

    send_resp(conn, :no_content, "")
  end
end
