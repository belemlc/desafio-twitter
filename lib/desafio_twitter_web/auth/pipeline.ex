defmodule DesafioTwitterWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :desafio_twitter,
    module: DesafioTwitter.Auth.Guardian,
    error_handler: DesafioTwitterWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
