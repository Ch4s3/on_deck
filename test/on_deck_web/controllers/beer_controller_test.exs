defmodule OnDeckWeb.BeerControllerTest do
  use OnDeckWeb.ConnCase

  alias OnDeck.Recipes
  alias OnDeck.Recipes.Beer

  @create_attrs %{abv: 120.5, boil_time: 42, bottle_or_keg_date: ~D[2010-04-17], brew_date: ~D[2010-04-17], description: "some description", estimated_ibu: 120.5, ingredients: %{}, measured_final_gravity: 120.5, measured_original_gravity: 120.5, name: "some name", rating: 120.5, srm: 120.5, style: "some style", volume_in_liters: 120.5}
  @update_attrs %{abv: 456.7, boil_time: 43, bottle_or_keg_date: ~D[2011-05-18], brew_date: ~D[2011-05-18], description: "some updated description", estimated_ibu: 456.7, ingredients: %{}, measured_final_gravity: 456.7, measured_original_gravity: 456.7, name: "some updated name", rating: 456.7, srm: 456.7, style: "some updated style", volume_in_liters: 456.7}
  @invalid_attrs %{abv: nil, boil_time: nil, bottle_or_keg_date: nil, brew_date: nil, description: nil, estimated_ibu: nil, ingredients: nil, measured_final_gravity: nil, measured_original_gravity: nil, name: nil, rating: nil, srm: nil, style: nil, volume_in_liters: nil}

  def fixture(:beer) do
    {:ok, beer} = Recipes.create_beer(@create_attrs)
    beer
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all beers", %{conn: conn} do
      conn = get conn, beer_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create beer" do
    test "renders beer when data is valid", %{conn: conn} do
      conn = post conn, beer_path(conn, :create), beer: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, beer_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "abv" => 120.5,
        "boil_time" => 42,
        "bottle_or_keg_date" => ~D[2010-04-17],
        "brew_date" => ~D[2010-04-17],
        "description" => "some description",
        "estimated_ibu" => 120.5,
        "ingredients" => %{},
        "measured_final_gravity" => 120.5,
        "measured_original_gravity" => 120.5,
        "name" => "some name",
        "rating" => 120.5,
        "srm" => 120.5,
        "style" => "some style",
        "volume_in_liters" => 120.5}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, beer_path(conn, :create), beer: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update beer" do
    setup [:create_beer]

    test "renders beer when data is valid", %{conn: conn, beer: %Beer{id: id} = beer} do
      conn = put conn, beer_path(conn, :update, beer), beer: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, beer_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "abv" => 456.7,
        "boil_time" => 43,
        "bottle_or_keg_date" => ~D[2011-05-18],
        "brew_date" => ~D[2011-05-18],
        "description" => "some updated description",
        "estimated_ibu" => 456.7,
        "ingredients" => %{},
        "measured_final_gravity" => 456.7,
        "measured_original_gravity" => 456.7,
        "name" => "some updated name",
        "rating" => 456.7,
        "srm" => 456.7,
        "style" => "some updated style",
        "volume_in_liters" => 456.7}
    end

    test "renders errors when data is invalid", %{conn: conn, beer: beer} do
      conn = put conn, beer_path(conn, :update, beer), beer: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete beer" do
    setup [:create_beer]

    test "deletes chosen beer", %{conn: conn, beer: beer} do
      conn = delete conn, beer_path(conn, :delete, beer)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, beer_path(conn, :show, beer)
      end
    end
  end

  defp create_beer(_) do
    beer = fixture(:beer)
    {:ok, beer: beer}
  end
end
