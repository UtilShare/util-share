defmodule Utilshare.Accounts.Household do
  use Ecto.Schema
  import Ecto.Changeset
  alias Utilshare.Accounts.Household


  schema "households" do
    field :name, :string
    belongs_to(:owner, Utilshare.Accounts.User)
    timestamps()
  end

  @doc false
  def changeset(%Household{} = household, attrs) do
    household
    |> cast(attrs, [:name, :owner_id])
    |> validate_required([:name, :owner_id])
  end
end
