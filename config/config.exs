# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :on_deck,
  ecto_repos: [OnDeck.Repo]

# Configures the endpoint
config :on_deck, OnDeckWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pCeHoh6C+dDqf/OxkNJSFYOBp+tiMMZJG1UuVuy1lFnYl1EEVjGBVIHwgOml7GVK",
  render_errors: [view: OnDeckWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: OnDeck.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
