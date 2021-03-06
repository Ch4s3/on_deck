defmodule OnDeck.Schema do
  use Absinthe.Schema
  import_types OnDeck.Schema.Types

  query do
    field :user, type: :user do
      arg :uuid, non_null(:string)
      resolve &OnDeck.Accounts.UserResolver.one/2
    end

    # field :beers, list_of(:beer) do
    #   arg :on_tap, :boolean
    #   resolve &OnDeck.Recipes.BeerResolver.all/2
    # end

    field :beer, type: :beer do
      arg :id, non_null(:id)
      resolve &OnDeck.Recipes.BeerResolver.one/2
    end 
  end
end
