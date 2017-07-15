defmodule ChickenFingersClub.RestaurantControllerTest do
  use ChickenFingersClub.ConnCase

  alias ChickenFingersClub.Restaurant
  @valid_attrs %{alt: "120.5", lat: "120.5", lon: "120.5", name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, restaurant_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    restaurant = Repo.insert! %Restaurant{}
    conn = get conn, restaurant_path(conn, :show, restaurant)
    assert json_response(conn, 200)["data"] == %{"id" => restaurant.id,
      "name" => restaurant.name,
      "lat" => restaurant.lat,
      "lon" => restaurant.lon,
      "alt" => restaurant.alt,
      "scores" => restaurant.scores}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, restaurant_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, restaurant_path(conn, :create), restaurant: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Restaurant, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, restaurant_path(conn, :create), restaurant: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    restaurant = Repo.insert! %Restaurant{}
    conn = put conn, restaurant_path(conn, :update, restaurant), restaurant: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Restaurant, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    restaurant = Repo.insert! %Restaurant{}
    conn = put conn, restaurant_path(conn, :update, restaurant), restaurant: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    restaurant = Repo.insert! %Restaurant{}
    conn = delete conn, restaurant_path(conn, :delete, restaurant)
    assert response(conn, 204)
    refute Repo.get(Restaurant, restaurant.id)
  end
end
