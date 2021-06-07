defmodule Movekr.Repo.Migrations.CreateColumns do
  use Ecto.Migration

  def change do
    create table(:columns) do
      add :name, :string
      add :order, :integer
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end

    create index(:columns, [:project_id])
  end
end
