defmodule DesafioTwitter.UserStatus.Status do
  use Ecto.Schema
  import Ecto.Changeset
  alias DesafioTwitter.Account.User

  schema "status" do
    field :status, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(status, attrs) do
    status
    |> cast(attrs, [:status, :user_id])
    |> validate_required([:status, :user_id])
  end
end
