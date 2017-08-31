defmodule OnDeck.Schema do
  use Absinthe.Schema
  import_types OnDeck.Schema.Types

  query do
    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &OnDeck.Accounts.UserResolver.one/2
    end

    field :beers, list_of(:beer) do
      resolve &OnDeck.Recipes.BeerResolver.all/2
    end

    field :beer, type: :beer do
      arg :id, non_null(:id)
      resolve &OnDeck.Recipes.BeerResolver.one/2
    end 
  end
end
