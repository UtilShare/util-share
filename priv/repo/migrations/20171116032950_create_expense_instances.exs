defmodule Utilshare.Repo.Migrations.CreateExpenseInstances do
  use Ecto.Migration

  def change do
    create table(:expense_instances) do
      add :complete, :boolean, default: false, null: false
      add :note, :string
      add :expense_id, references(:expenses, on_delete: :nothing)

      timestamps()
    end

    create index(:expense_instances, [:expense_id])
  end
end
