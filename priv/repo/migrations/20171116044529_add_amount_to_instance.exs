defmodule Utilshare.Repo.Migrations.AddAmountToInstance do
  use Ecto.Migration

  def change do
    alter table("expense_instances") do
      add :amount, :decimal, precision: 12, scale: 2
    end
  end
end
