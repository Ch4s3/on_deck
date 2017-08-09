defmodule OnDeck.Recipes.Beer do
  use Ecto.Schema
  import Ecto.Changeset
  alias OnDeck.Recipes.Beer


  schema "beers" do
    field :abv, :float
    field :boil_time, :integer
    field :bottle_or_keg_date, :date
    field :brew_date, :date
    field :description, :string
    field :estimated_ibu, :float
    field :ingredients, :map
    field :measured_final_gravity, :float
    field :measured_original_gravity, :float
    field :name, :string
    field :rating, :float
    field :srm, :float
    field :style, :string
    field :volume_in_liters, :float
    belongs_to :user, OnDeck.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Beer{} = beer, attrs) do
    beer
    |> cast(attrs, [:name, :description, :style, :ingredients, :abv, :estimated_ibu, :srm, :measured_original_gravity, :measured_final_gravity, :boil_time, :brew_date, :bottle_or_keg_date, :volume_in_liters, :rating, :user_id])
    |> validate_required([:name, :description, :style, :ingredients, :abv, :estimated_ibu, :srm, :measured_original_gravity, :measured_final_gravity, :boil_time, :brew_date, :bottle_or_keg_date, :volume_in_liters, :rating])
  end
end
