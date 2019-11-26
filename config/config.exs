# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :desafio_twitter,
  ecto_repos: [DesafioTwitter.Repo]

# Configures the endpoint
config :desafio_twitter, DesafioTwitterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1Fv0GZ3YKHNGUcSfGCwKMJDi9nfUx2F1Ff/wufsdwemz5bXJRc0uxxPQ0URwZLDQ",
  render_errors: [view: DesafioTwitterWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: DesafioTwitter.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Config Guardian
config :desafio_twitter, DesafioTwitter.Auth.Guardian,
  issuer: "desafio_twitter",
  verify_module: Guardian.JWT,
  secret_key: "Y6g+t6NiAmnarDrMgV2b8ulhNNtKL7jcT2xYfFwa+One3aR0mRqXgVq1wGspOJ1C"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
