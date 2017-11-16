defmodule Utilshare.Payment.PaymentRequest do
  use Ecto.Schema
  import Ecto.Changeset
  alias Utilshare.Payment.PaymentRequest


  schema "payment_requests" do
    field :percent, :integer
    field :transaction_id, :string
    # belongs_to(:expense, Utilshare.Payment.)
    field :expense_instance, :id
    field :requester, :id
    field :requestee, :id
    field :paid_at, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(%PaymentRequest{} = payment_request, attrs) do
    payment_request
    |> cast(attrs, [:percent])
    |> validate_required([:percent])
  end
end
