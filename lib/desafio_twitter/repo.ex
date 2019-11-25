defmodule DesafioTwitter.Repo do
  use Ecto.Repo,
    otp_app: :desafio_twitter,
    adapter: Ecto.Adapters.Postgres
end
