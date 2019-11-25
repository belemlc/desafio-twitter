use Mix.Config

# Configure your database
config :desafio_twitter, DesafioTwitter.Repo,
  username: "postgres",
  password: "postgres",
  database: "desafio_twitter_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :desafio_twitter, DesafioTwitterWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
