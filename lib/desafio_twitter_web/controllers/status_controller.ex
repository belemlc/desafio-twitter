defmodule DesafioTwitterWeb.StatusController do
  use DesafioTwitterWeb, :controller

  alias DesafioTwitter.UserStatus
  alias DesafioTwitter.UserStatus.Status

  action_fallback DesafioTwitterWeb.FallbackController

  def index(conn, _params) do
    status = UserStatus.list_status()
    render(conn, "index.json", status: status)
  end

  def create(conn, %{"status" => status_params}) do
    with {:ok, %Status{} = status} <- UserStatus.create_status(status_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.status_path(conn, :show, status))
      |> render("show.json", status: status)
    end
  end

  def show(conn, %{"id" => id}) do
    status = UserStatus.get_status!(id)
    render(conn, "show.json", status: status)
  end

  def update(conn, %{"id" => id, "status" => status_params}) do
    status = UserStatus.get_status!(id)

    with {:ok, %Status{} = status} <- UserStatus.update_status(status, status_params) do
      render(conn, "show.json", status: status)
    end
  end

  def delete(conn, %{"id" => id}) do
    status = UserStatus.get_status!(id)

    with {:ok, %Status{}} <- UserStatus.delete_status(status) do
      send_resp(conn, :no_content, "")
    end
  end
end
