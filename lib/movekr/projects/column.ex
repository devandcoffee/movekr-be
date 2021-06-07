defmodule Movekr.Projects.Column do
  use Ecto.Schema
  import Ecto.Changeset

  schema "columns" do
    field :name, :string
    field :order, :integer
    field :project_id, :id

    timestamps()
  end

  @doc false
  def changeset(column, attrs) do
    column
    |> cast(attrs, [:name, :order])
    |> validate_required([:name, :order])
  end
end
