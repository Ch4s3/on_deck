defmodule OnDeckWeb.BeerController do
  use OnDeckWeb, :controller

  alias OnDeck.Recipes
  alias OnDeck.Recipes.Beer

  action_fallback OnDeckWeb.FallbackController

  def index(conn, _params) do
    beers = Recipes.list_beers()
    render(conn, "index.json", beers: beers)
  end

  def create(conn, %{"beer" => beer_params}) do
    with {:ok, %Beer{} = beer} <- Recipes.create_beer(beer_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", beer_path(conn, :show, beer))
      |> render("show.json", beer: beer)
    end
  end

  def show(conn, %{"id" => id}) do
    beer = Recipes.get_beer!(id)
    render(conn, "show.json", beer: beer)
  end

  def update(conn, %{"id" => id, "beer" => beer_params}) do
    beer = Recipes.get_beer!(id)

    with {:ok, %Beer{} = beer} <- Recipes.update_beer(beer, beer_params) do
      render(conn, "show.json", beer: beer)
    end
  end

  def delete(conn, %{"id" => id}) do
    beer = Recipes.get_beer!(id)
    with {:ok, %Beer{}} <- Recipes.delete_beer(beer) do
      send_resp(conn, :no_content, "")
    end
  end
end
