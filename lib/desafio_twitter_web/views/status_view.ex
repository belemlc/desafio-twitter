defmodule DesafioTwitterWeb.StatusView do
  use DesafioTwitterWeb, :view
  alias DesafioTwitterWeb.StatusView

  def render("index.json", %{status: status}) do
    %{data: render_many(status, StatusView, "status.json")}
  end

  def render("show.json", %{status: status}) do
    %{data: render_one(status, StatusView, "status.json")}
  end

  def render("status.json", %{status: status}) do
    %{id: status.id,
      status: status.status,
      user_id: status.user_id}
  end
end
