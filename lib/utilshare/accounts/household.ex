defmodule Utilshare.Accounts.Household do
  use Ecto.Schema
  import Ecto.Changeset
  alias Utilshare.Accounts.Household


  schema "households" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Household{} = household, attrs) do
    household
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
