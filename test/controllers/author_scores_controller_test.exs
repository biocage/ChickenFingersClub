defmodule ChickenFingersClub.AuthorScoresControllerTest do
  use ChickenFingersClub.ConnCase

  alias ChickenFingersClub.AuthorScores
  @valid_attrs %{author_references_authors: "some content", breading: "120.5", chicken: "120.5", crispiness: "120.5", date: %{day: 17, month: 4, year: 2010}, overall: "120.5"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, author_scores_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    author_scores = Repo.insert! %AuthorScores{}
    conn = get conn, author_scores_path(conn, :show, author_scores)
    assert json_response(conn, 200)["data"] == %{"id" => author_scores.id,
      "overall" => author_scores.overall,
      "chicken" => author_scores.chicken,
      "breading" => author_scores.breading,
      "crispiness" => author_scores.crispiness,
      "date" => author_scores.date,
      "author_references_authors" => author_scores.author_references_authors}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, author_scores_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, author_scores_path(conn, :create), author_scores: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(AuthorScores, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, author_scores_path(conn, :create), author_scores: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    author_scores = Repo.insert! %AuthorScores{}
    conn = put conn, author_scores_path(conn, :update, author_scores), author_scores: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(AuthorScores, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    author_scores = Repo.insert! %AuthorScores{}
    conn = put conn, author_scores_path(conn, :update, author_scores), author_scores: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    author_scores = Repo.insert! %AuthorScores{}
    conn = delete conn, author_scores_path(conn, :delete, author_scores)
    assert response(conn, 204)
    refute Repo.get(AuthorScores, author_scores.id)
  end
end
