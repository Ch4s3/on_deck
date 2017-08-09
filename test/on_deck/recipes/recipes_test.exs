defmodule OnDeck.RecipesTest do
  use OnDeck.DataCase

  alias OnDeck.Recipes

  describe "beers" do
    alias OnDeck.Recipes.Beer

    @valid_attrs %{abv: 120.5, boil_time: 42, bottle_or_keg_date: ~D[2010-04-17], brew_date: ~D[2010-04-17], description: "some description", estimated_ibu: 120.5, ingredients: %{}, measured_final_gravity: 120.5, measured_original_gravity: 120.5, name: "some name", rating: 120.5, srm: 120.5, style: "some style", volume_in_liters: 120.5}
    @update_attrs %{abv: 456.7, boil_time: 43, bottle_or_keg_date: ~D[2011-05-18], brew_date: ~D[2011-05-18], description: "some updated description", estimated_ibu: 456.7, ingredients: %{}, measured_final_gravity: 456.7, measured_original_gravity: 456.7, name: "some updated name", rating: 456.7, srm: 456.7, style: "some updated style", volume_in_liters: 456.7}
    @invalid_attrs %{abv: nil, boil_time: nil, bottle_or_keg_date: nil, brew_date: nil, description: nil, estimated_ibu: nil, ingredients: nil, measured_final_gravity: nil, measured_original_gravity: nil, name: nil, rating: nil, srm: nil, style: nil, volume_in_liters: nil}

    def beer_fixture(attrs \\ %{}) do
      {:ok, beer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Recipes.create_beer()

      beer
    end

    test "list_beers/0 returns all beers" do
      beer = beer_fixture()
      assert Recipes.list_beers() == [beer]
    end

    test "get_beer!/1 returns the beer with given id" do
      beer = beer_fixture()
      assert Recipes.get_beer!(beer.id) == beer
    end

    test "create_beer/1 with valid data creates a beer" do
      assert {:ok, %Beer{} = beer} = Recipes.create_beer(@valid_attrs)
      assert beer.abv == 120.5
      assert beer.boil_time == 42
      assert beer.bottle_or_keg_date == ~D[2010-04-17]
      assert beer.brew_date == ~D[2010-04-17]
      assert beer.description == "some description"
      assert beer.estimated_ibu == 120.5
      assert beer.ingredients == %{}
      assert beer.measured_final_gravity == 120.5
      assert beer.measured_original_gravity == 120.5
      assert beer.name == "some name"
      assert beer.rating == 120.5
      assert beer.srm == 120.5
      assert beer.style == "some style"
      assert beer.volume_in_liters == 120.5
    end

    test "create_beer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recipes.create_beer(@invalid_attrs)
    end

    test "update_beer/2 with valid data updates the beer" do
      beer = beer_fixture()
      assert {:ok, beer} = Recipes.update_beer(beer, @update_attrs)
      assert %Beer{} = beer
      assert beer.abv == 456.7
      assert beer.boil_time == 43
      assert beer.bottle_or_keg_date == ~D[2011-05-18]
      assert beer.brew_date == ~D[2011-05-18]
      assert beer.description == "some updated description"
      assert beer.estimated_ibu == 456.7
      assert beer.ingredients == %{}
      assert beer.measured_final_gravity == 456.7
      assert beer.measured_original_gravity == 456.7
      assert beer.name == "some updated name"
      assert beer.rating == 456.7
      assert beer.srm == 456.7
      assert beer.style == "some updated style"
      assert beer.volume_in_liters == 456.7
    end

    test "update_beer/2 with invalid data returns error changeset" do
      beer = beer_fixture()
      assert {:error, %Ecto.Changeset{}} = Recipes.update_beer(beer, @invalid_attrs)
      assert beer == Recipes.get_beer!(beer.id)
    end

    test "delete_beer/1 deletes the beer" do
      beer = beer_fixture()
      assert {:ok, %Beer{}} = Recipes.delete_beer(beer)
      assert_raise Ecto.NoResultsError, fn -> Recipes.get_beer!(beer.id) end
    end

    test "change_beer/1 returns a beer changeset" do
      beer = beer_fixture()
      assert %Ecto.Changeset{} = Recipes.change_beer(beer)
    end
  end
end
