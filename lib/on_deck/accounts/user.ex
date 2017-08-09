defmodule OnDeck.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias OnDeck.Accounts.User


  schema "users" do
    field :email, :string
    field :name, :string
    field :uuid, Ecto.UUID
    has_many :beers, OnDeck.Recipes.Beer, foreign_key: :user_id

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> validate_length(:name, min: 4)
    |> generate_uuid
  end

  def generate_uuid(changeset) do
    changeset
    |> put_change(:uuid, Ecto.UUID.generate())
  end
end