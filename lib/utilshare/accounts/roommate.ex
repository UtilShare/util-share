defmodule Utilshare.Accounts.Roommate do
  use Ecto.Schema
  import Ecto.Changeset
  alias Utilshare.Accounts.Roommate


  schema "roommates" do
    # field :user_id, :id
    belongs_to(:user, Utilshare.Accounts.User)
    # field :household_id, :id
    belongs_to(:household, Utilshare.Accounts.Household)

    timestamps()
  end

  @doc false
  def changeset(%Roommate{} = roommate, attrs) do
    roommate
    |> cast(attrs, [:user_id, :household_id])
    |> validate_required([:user_id, :household_id])
  end
end
