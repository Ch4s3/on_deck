defmodule OnDeck.Recipes.BeerResolver do
  alias OnDeck.{Recipes, Recipes.Beer, Repo}

  def all(_args, _info) do
    {:ok, Repo.all(Beer)}
  end
  
  def one(args, _info) do
    id = String.to_integer(args.id)
    {:ok, Recipes.get_beer!(id)}
  end

  def create(args, _info) do
    %Beer{}
    |> Beer.changeset(args)
    |> Repo.insert
  end
end
