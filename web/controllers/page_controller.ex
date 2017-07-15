defmodule ChickenFingersClub.PageController do
  use ChickenFingersClub.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
