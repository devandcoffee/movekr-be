defmodule Movekr.Projects.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :description, :string
    field :end_date, :date
    field :start_date, :date
    field :status, :boolean, default: false
    field :column_id, :id
    field :project_id, :id

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:description, :start_date, :end_date, :status])
    |> validate_required([:description, :start_date, :end_date, :status])
  end
end
