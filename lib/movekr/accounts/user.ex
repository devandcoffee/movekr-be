defmodule Movekr.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Movekr.Projects.Project

  schema "users" do
    field :mail, :string
    field :name, :string
    field :password, :string
    has_many :projects, Project, foreign_key: :owner_id

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
