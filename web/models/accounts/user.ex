defmodule OnDeck.Accounts.User do
  use OnDeck.Web, :model

  schema "users" do
    field :email, :string
    field :name, :string
    field :uuid, Ecto.UUID

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :name, :uuid])
    |> validate_required([:email, :name, :uuid])
  end
end
