defmodule OnDeck.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias OnDeck.Accounts.User


  schema "users" do
    field :email, :string
    field :name, :string
    field :uuid, Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email, :uuid])
    |> validate_required([:name, :email, :uuid])
  end
end
