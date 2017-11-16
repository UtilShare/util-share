defmodule Utilshare.Payment.ExpenseInstance do
  use Ecto.Schema
  import Ecto.Changeset
  alias Utilshare.Payment.ExpenseInstance


  schema "expense_instances" do
    field :complete, :boolean, default: false
    field :note, :string
    belongs_to(:expense, Utilshare.Payment.Expense)

    timestamps()
  end

  @doc false
  def changeset(%ExpenseInstance{} = expense_instance, attrs) do
    expense_instance
    |> cast(attrs, [:complete, :note, :expense_id])
    |> validate_required([:complete, :note, :expense_id])
  end
end
