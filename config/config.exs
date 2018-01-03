# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :musicapi,
  ecto_repos: [Musicapi.Repo]

# Configures the endpoint
config :musicapi, MusicapiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Eb1CSY3ojjYyYEhX0WTArGf1r2hYFJwIkJC5jQhGjeKtaCZLB0+XLYSv6KuZk253",
  render_errors: [view: MusicapiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Musicapi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
