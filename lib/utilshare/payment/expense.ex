defmodule Utilshare.Payment.Expense do
  use Ecto.Schema
  import Ecto.Changeset
  alias Utilshare.Payment.Expense
  alias Utilshare.Payment.ExpenseInstance


  schema "expenses" do
    field :name, :string
    field :desc, :string

    belongs_to(:household, Utilshare.Accounts.Household)
    belongs_to(:owner, Utilshare.Accounts.User)

    has_many :instances, ExpenseInstance, foreign_key: :expense_id

    timestamps()
  end

  @doc false
  def changeset(%Expense{} = expense, attrs) do
    expense
    |> cast(attrs, [:name, :desc, :household_id, :owner_id])
    |> validate_required([:name, :desc, :household_id, :owner_id])
  end
end
