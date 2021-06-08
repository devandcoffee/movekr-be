defmodule Movekr.Projects.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Movekr.Projects.Column
  alias Movekr.Projects.Project

  schema "tasks" do
    field :description, :string
    field :end_date, :date
    field :start_date, :date
    field :status, :boolean, default: false
    belongs_to :column, Column
    belongs_to :project, Project

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:description, :start_date, :end_date, :status])
    |> validate_required([:description, :start_date, :end_date, :status])
  end
end
