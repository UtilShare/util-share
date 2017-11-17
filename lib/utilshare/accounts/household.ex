defmodule Utilshare.Accounts.Household do
  use Ecto.Schema
  import Ecto.Changeset
  alias Utilshare.Accounts.Household
  alias Utilshare.Accounts.Roommate


  schema "households" do
    field :name, :string
    has_many :memberships, Roommate, foreign_key: :household_id
    has_many :users, through: [:memberships, :user]
    timestamps()
  end

  @doc false
  def changeset(%Household{} = household, attrs) do
    household
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
