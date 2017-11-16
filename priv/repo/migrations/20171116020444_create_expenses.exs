defmodule Utilshare.Repo.Migrations.CreateExpenses do
  use Ecto.Migration

  def change do
    create table(:expenses) do
      add :name, :string
      add :desc, :string
      add :household_id, references(:households, on_delete: :nothing)
      add :owner_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:expenses, [:household_id])
    create index(:expenses, [:owner_id])
  end
end
