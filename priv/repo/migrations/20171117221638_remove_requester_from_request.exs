defmodule Utilshare.Repo.Migrations.RemoveRequesterFromRequest do
  use Ecto.Migration

  def change do
    alter table(:payment_requests) do
      remove :requester_id
    end
  end
end
