defmodule Utilshare.Repo.Migrations.CreateHouseholds do
  use Ecto.Migration

  def change do
    create table(:households) do
      add :name, :string

      timestamps()
    end

  end
end
