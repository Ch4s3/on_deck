defmodule OnDeck.Repo.Migrations.AddOnTapToBeer do
  use Ecto.Migration

  def change do
    alter table(:beers) do
      add :on_tap, :boolean
    end
  end
end
