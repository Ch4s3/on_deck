defmodule OnDeck.Recipes do
  @moduledoc """
  The Recipes context.
  """

  import Ecto.Query, warn: false
  alias OnDeck.Repo
  alias Ecto.Changeset
  alias OnDeck.Recipes.Beer

  @doc """
  Returns the list of beers.

  ## Examples

      iex> list_beers()
      [%Beer{}, ...]

  """
  def list_beers do
    Repo.all(Beer)
  end

  @doc """
  Gets a single beer.

  Raises `Ecto.NoResultsError` if the Beer does not exist.

  ## Examples

      iex> get_beer!(123)
      %Beer{}

      iex> get_beer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_beer!(id), do: Repo.get!(Beer, id)

  @doc """
  Creates a beer.

  ## Examples

      iex> user = OnDeck.Accounts.create_user(%{email:"some@email.com, name: "alec"})
      ...>  {abv, _} = Float.parse "#{:rand.uniform(10)}.#{:rand.uniform(9)}"
      ...> {og, _} = Float.parse "1.0#{:rand.uniform(7)}#{:rand.uniform(9)}"
      ...> {fg, _} = Float.parse "1.0#{:rand.uniform(2)}#{:rand.uniform(4)}"
      ...> create_beer(user,
            %{abv: abv,
              boil_time: :rand.uniform(120),
              bottle_or_keg_date: Faker.Date.backward(10),
              brew_date: Faker.Date.backward(40),
              description: Faker.Lorem.sentence,
              estimated_ibu: :rand.uniform(95),
              ingredients: %{},
              measured_final_gravity: fg,
              measured_original_gravity: og,
              name: Enum.join(Faker.Lorem.words(2), " "),
              rating: :rand.uniform(100),
              srm: :rand.uniform(70),
              style: Faker.Lorem.word,
              volume_in_liters: :rand.uniform(44)}
          )
      {:ok, %Beer{}}

      iex> create_beer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_beer(user, attrs \\ %{}) do
    %Beer{}
    |> Beer.changeset(attrs)
    |> Changeset.put_assoc(:user, user)
    |> Repo.insert()
  end

  @doc """
  Updates a beer.

  ## Examples

      iex> update_beer(beer, %{field: new_value})
      {:ok, %Beer{}}

      iex> update_beer(beer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_beer(%Beer{} = beer, attrs) do
    beer
    |> Beer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Beer.

  ## Examples

      iex> delete_beer(beer)
      {:ok, %Beer{}}

      iex> delete_beer(beer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_beer(%Beer{} = beer) do
    Repo.delete(beer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking beer changes.

  ## Examples

      iex> change_beer(beer)
      %Ecto.Changeset{source: %Beer{}}

  """
  def change_beer(%Beer{} = beer) do
    Beer.changeset(beer, %{})
  end
end
