defmodule Utilshare.Payment.ExpenseInstance do
  use Ecto.Schema
  import Ecto.Changeset
  alias Utilshare.Payment.ExpenseInstance
  alias Utilshare.Payment.PaymentRequest

  schema "expense_instances" do
    field :complete, :boolean, default: false
    field :note, :string
    field :amount, :decimal
    belongs_to(:expense, Utilshare.Payment.Expense)
    has_many(:splits, PaymentRequest, foreign_key: :expense_instance_id)

    timestamps()
  end

  @doc false
  def changeset(%ExpenseInstance{} = expense_instance, attrs) do
    expense_instance
    |> cast(attrs, [:complete, :note, :amount, :expense_id])
    |> validate_required([:complete, :expense_id, :amount])
  end
end
