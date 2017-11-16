defmodule Utilshare.Payment.Expense do
  use Ecto.Schema
  import Ecto.Changeset
  alias Utilshare.Payment.Expense


  schema "expenses" do
    field :desc, :string
    field :name, :string
    belongs_to(:household, Utilshare.Accounts.Household)
    belongs_to(:owner, Utilshare.Accounts.User)
    # field :household_id, :id
    # field :owner_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Expense{} = expense, attrs) do
    expense
    |> cast(attrs, [:name, :desc, :household_id, :owner_id])
    |> validate_required([:name, :desc, :household_id, :owner_id])
  end
end
