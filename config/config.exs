# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :chicken_fingers_club,
  ecto_repos: [ChickenFingersClub.Repo]

# Configures the endpoint
config :chicken_fingers_club, ChickenFingersClub.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tHP0WMVl9O794YT5zCx+S8ibnY6iMi//rzWHMhtGbGX2REeJdVpRINy+fvkA50Cy",
  render_errors: [view: ChickenFingersClub.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ChickenFingersClub.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
