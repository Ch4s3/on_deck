defmodule OnDeckWeb.BeerView do
  use OnDeckWeb, :view
  alias OnDeckWeb.BeerView

  def render("index.json", %{beers: beers}) do
    %{data: render_many(beers, BeerView, "beer.json")}
  end

  def render("show.json", %{beer: beer}) do
    %{data: render_one(beer, BeerView, "beer.json")}
  end

  def render("beer.json", %{beer: beer}) do
    %{id: beer.id,
      name: beer.name,
      description: beer.description,
      style: beer.style,
      ingredients: beer.ingredients,
      abv: beer.abv,
      estimated_ibu: beer.estimated_ibu,
      srm: beer.srm,
      measured_original_gravity: beer.measured_original_gravity,
      measured_final_gravity: beer.measured_final_gravity,
      boil_time: beer.boil_time,
      brew_date: beer.brew_date,
      bottle_or_keg_date: beer.bottle_or_keg_date,
      volume_in_liters: beer.volume_in_liters,
      rating: beer.rating}
  end
end
