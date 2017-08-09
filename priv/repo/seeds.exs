alias OnDeck.{Accounts, Recipes, Repo}

for _ <- 1..10 do
    {:ok, user} = 
      Accounts.create_user( 
        %{name: Faker.Name.name,
          email: Faker.Internet.safe_email})
  for _ <- 1..3 do
    {abv, _} = Float.parse "#{:rand.uniform(10)}.#{:rand.uniform(9)}"
    {og, _} = Float.parse "1.0#{:rand.uniform(7)}#{:rand.uniform(9)}"
    {fg, _} = Float.parse "1.0#{:rand.uniform(2)}#{:rand.uniform(4)}"
    Recipes.create_beer(user,
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
  end
end