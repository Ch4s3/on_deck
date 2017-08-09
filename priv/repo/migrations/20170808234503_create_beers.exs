defmodule OnDeck.Repo.Migrations.CreateBeers do
  use Ecto.Migration

  def change do
    create table(:beers) do
      add :name, :text
      add :description, :text
      add :style, :text
      add :ingredients, :map
      add :abv, :float
      add :estimated_ibu, :float
      add :srm, :float
      add :measured_original_gravity, :float
      add :measured_final_gravity, :float
      add :boil_time, :integer
      add :brew_date, :date
      add :bottle_or_keg_date, :date
      add :volume_in_liters, :float
      add :rating, :float
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:beers, [:user_id])
  end
end
