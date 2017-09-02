defmodule OnDeck.Recipes.BeerResolver do
  alias OnDeck.{Recipes, Recipes.Beer, Repo}
  import Ecto.Query, warn: false
  def on_tap(query, args, _info) do
    on_tap = args.on_tap
    query |> where([b], b.on_tap == ^on_tap)
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
