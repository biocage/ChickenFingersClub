defmodule ChickenFingersClub.PhotoView do
  use ChickenFingersClub.Web, :view

  def render("index.json", %{photos: photos}) do
    %{data: render_many(photos, ChickenFingersClub.PhotoView, "photo.json")}
  end

  def render("show.json", %{photo: photo}) do
    %{data: render_one(photo, ChickenFingersClub.PhotoView, "photo.json")}
  end

  def render("photo.json", %{photo: photo}) do
    %{id: photo.id,
      title: photo.title,
      group: photo.group,
      url: photo.url,
      x: photo.x,
      y: photo.y,
      disk_size: photo.disk_size}
  end
end
