defmodule Movekr.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :description, :string
      add :start_date, :date
      add :end_date, :date
      add :status, :boolean, default: false, null: false
      add :column_id, references(:columns, on_delete: :nothing)
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end

    create index(:tasks, [:column_id])
    create index(:tasks, [:project_id])
  end
end
