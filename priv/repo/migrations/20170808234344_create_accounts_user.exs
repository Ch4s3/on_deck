defmodule OnDeck.Repo.Migrations.CreateAccounts.User do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :name, :string
      add :uuid, :uuid

      timestamps()
    end
  end
end
