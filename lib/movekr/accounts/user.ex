defmodule Movekr.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :mail, :string
    field :name, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :mail, :password])
    |> validate_required([:name, :mail, :password])
    |> unique_constraint(:mail)
  end
end
