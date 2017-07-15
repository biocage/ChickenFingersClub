defmodule ChickenFingersClub.Router do
  use ChickenFingersClub.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChickenFingersClub do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", ChickenFingersClub do
    pipe_through :api

    #scope "/v1", dd do
    resources "/posts", AuthorController, except: [:new, :edit]
    resources "/photos", PhotoController, except: [:new, :edit]
    resources "/author_scores", AuthorScoresController, except: [:new, :edit]
    resources "/restaurants", RestaurantController, except: [:new, :edit]
    resources "/articles", ArticleController, except: [:new, :edit]
    # end
  end
end
