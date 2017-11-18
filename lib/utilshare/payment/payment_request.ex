defmodule Utilshare.Payment.PaymentRequest do
  use Ecto.Schema
  import Ecto.Changeset
  alias Utilshare.Payment.PaymentRequest


  schema "payment_requests" do
    field :percent, :integer
    field :transaction_id, :string
    belongs_to(:expense_instance, Utilshare.Payment.ExpenseInstance)
    belongs_to(:requestee, Utilshare.Accounts.User)
    field :paid_at, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(%PaymentRequest{} = payment_request, attrs) do
    payment_request
    |> cast(attrs, [:percent, :requestee_id, :expense_instance_id, :paid_at])
    |> validate_required([:percent, :requestee_id, :expense_instance_id])
  end
end
