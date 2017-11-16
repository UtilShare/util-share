defmodule Utilshare.Repo.Migrations.CreatePaymentRequests do
  use Ecto.Migration

  def change do
    create table(:payment_requests) do
      add :percent, :integer
      add :expense_instance_id, references(:expense_instances, on_delete: :nothing)
      add :requester_id, references(:users, on_delete: :nothing)
      add :requestee_id, references(:users, on_delete: :nothing)
      add :transaction_id, :string
      add :paid_at, :utc_datetime

      timestamps()
    end

    create index(:payment_requests, [:expense_instance_id])
    create index(:payment_requests, [:requester_id])
    create index(:payment_requests, [:requestee_id])
  end
end
