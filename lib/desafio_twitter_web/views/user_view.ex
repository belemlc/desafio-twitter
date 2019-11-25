defmodule DesafioTwitterWeb.UserView do
  use DesafioTwitterWeb, :view
  alias DesafioTwitterWeb.UserView
  alias DesafioTwitterWeb.StatusView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("status.json", %{user: user}) do
    %{name: user.name,
    status: render_many(user.status, StatusView, "status.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      email: user.email,
      password: user.password}
  end
end
