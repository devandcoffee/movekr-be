defmodule Movekr.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :mail, :string
      add :password, :string

      timestamps()
    end

    create unique_index(:users, [:mail])
  end
end
