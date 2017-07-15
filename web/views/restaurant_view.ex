defmodule ChickenFingersClub.RestaurantView do
  use ChickenFingersClub.Web, :view

  def render("index.json", %{restaurants: restaurants}) do
    %{data: render_many(restaurants, ChickenFingersClub.RestaurantView, "restaurant.json")}
  end

  def render("show.json", %{restaurant: restaurant}) do
    %{data: render_one(restaurant, ChickenFingersClub.RestaurantView, "restaurant.json")}
  end

  def render("restaurant.json", %{restaurant: restaurant}) do
    %{id: restaurant.id,
      name: restaurant.name,
      lat: restaurant.lat,
      lon: restaurant.lon,
      alt: restaurant.alt,
      scores: restaurant.scores}
  end
end
