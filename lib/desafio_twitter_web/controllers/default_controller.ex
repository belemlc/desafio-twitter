defmodule DesafioTwitterWeb.DefaultController do
  use DesafioTwitterWeb, :controller

  def index(conn, _params) do
    text conn, "Hello world Elixir!"
  end
end
