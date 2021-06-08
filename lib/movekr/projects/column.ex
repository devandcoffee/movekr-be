defmodule Movekr.Projects.Column do
  use Ecto.Schema
  import Ecto.Changeset
  alias Movekr.Projects.Project
  alias Movekr.Projects.Task

  schema "columns" do
    field :name, :string
    field :order, :integer
    belongs_to :project, Project
    has_many :tasks, Task

    timestamps()
  end

  @doc false
  def changeset(column, attrs) do
    column
    |> cast(attrs, [:name, :order])
    |> validate_required([:name])
  end
end
