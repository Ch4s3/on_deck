defmodule OnDeck.Accounts.UserResolver do
  alias OnDeck.{Accounts, Accounts.User, Repo}

  def all(_args, _info) do
    {:ok, Repo.all(User)}
  end

  def one(args, _info) do
    uuid = args.uuid
    {:ok, Accounts.get_user!(uuid)}
  end
end
