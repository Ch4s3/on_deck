defmodule OnDeck.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: OnDeck.Repo

  scalar :json do
    parse fn input ->
      case Poison.decode(input.value) do
        {:ok, result} -> {:ok, result}
        _ -> :error
      end
    end
    
    serialize &Poison.encode!/1
  end

  object :beer do
    field :id, :id
    @desc "the name given to the beer by the user"
    field :name, :string
    @desc "a shprt description"
    field :description, :string
    @desc "BJCP (or similar) style"
    field :style, :string
    @desc "A JSON field of styles very loosely mapped from BeerXML http://www.beerxml.com/beerxml.htm"
    field :ingredients, :json
    @desc "Estimated ABV based on FG and OG"
    field :abv, :float
    @desc "Estimated IBU as calculated by BeerSmith (or similar)"
    field :estimated_ibu, :float
    @desc "Estimated SRM based on grain bill"
    field :srm, :float
    @desc "Origional Gravity as measured"
    field :measured_original_gravity, :float
    @desc "Final Gravity as measured"
    field :measured_final_gravity, :float
    @desc "Boil time in minutes"
    field :boil_time, :integer
    @desc "Date of brewing"
    field :brew_date, :string
    @desc "Date of bottling or kegging"
    field :bottle_or_keg_date, :string
    @desc "Bottling or kegging volume in liters"
    field :volume_in_liters, :float
    @desc "Rating from 0 to 100"
    field :rating, :float
    field :user, :user, resolve: assoc(:users)
  end

  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
    field :uuid, :string
    field :beers, list_of(:beer), resolve: assoc(:beers)
  end
end
