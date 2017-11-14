defmodule Utilshare.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first, :string
      add :last, :string
      add :email, :string
      add :dwolla_id, :string

      timestamps()
    end

  end
end
