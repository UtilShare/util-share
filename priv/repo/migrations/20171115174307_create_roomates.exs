defmodule Utilshare.Repo.Migrations.CreateRoommates do
  use Ecto.Migration

  def change do
    create table(:roommates) do
      add :user_id, references(:users, on_delete: :nothing)
      add :household_id, references(:households, on_delete: :nothing)
    end

    create index(:roommates, [:user_id])
    create index(:roommates, [:household_id])
  end
end
