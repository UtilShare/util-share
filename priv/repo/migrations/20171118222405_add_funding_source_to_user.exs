defmodule Utilshare.Repo.Migrations.AddFundingSourceToUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :balance_funding_source_id, :string
      add :bank_funding_source_id, :string
    end
  end
end
