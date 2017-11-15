defmodule Utilshare.Repo.Migrations.CreateRoomates do
  use Ecto.Migration

  def change do
    create table(:roomates) do
      add :user_id, references(:users, on_delete: :nothing)
      add :household_id, references(:households, on_delete: :nothing)

      timestamps()
    end

    create index(:roomates, [:user_id])
    create index(:roomates, [:household_id])

    alter table("households") do
      add :owner_id, references(:users, on_delete: :nothing)
    end
  end
end
