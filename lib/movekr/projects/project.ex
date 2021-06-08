defmodule Movekr.Projects.Project do
  use Ecto.Schema
  import Ecto.Changeset
  alias Movekr.Accounts.User
  alias Movekr.Projects.Column
  alias Movekr.Projects.Task

  schema "projects" do
    field :description, :string
    field :name, :string
    belongs_to :owner, User, references: :id, foreign_key: :owner_id
    has_many :columns, Column
    has_many :tasks, Task

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name, :description, :owner_id])
    |> validate_required([:name, :owner_id])
  end
end
