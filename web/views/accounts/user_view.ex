defmodule OnDeck.Accounts.UserView do
  use OnDeck.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, OnDeck.Accounts.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, OnDeck.Accounts.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      name: user.name,
      uuid: user.uuid}
  end
end
