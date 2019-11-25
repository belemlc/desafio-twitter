defmodule DesafioTwitter.Repo.Migrations.CreateStatus do
  use Ecto.Migration

  def change do
    create table(:status) do
      add :status, :string
      add :user_id, references(:users)

      timestamps()
    end

  end
end
