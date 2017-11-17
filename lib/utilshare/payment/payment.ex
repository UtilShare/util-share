defmodule Utilshare.Payment do
  @moduledoc """
  The Payment context.
  """

  import Ecto.Query, warn: false
  alias Utilshare.Repo

  alias Utilshare.Payment.Expense

  def list_expenses do
    Repo.all(Expense)
  end

  def get_expense!(id), do: Repo.get!(Expense, id)

  def create_expense(attrs \\ %{}) do
    %Expense{}
    |> Expense.changeset(attrs)
    |> Repo.insert()
  end

  def update_expense(%Expense{} = expense, attrs) do
    expense
    |> Expense.changeset(attrs)
    |> Repo.update()
  end

  def delete_expense(%Expense{} = expense) do
    Repo.delete(expense)
  end

  def change_expense(%Expense{} = expense) do
    Expense.changeset(expense, %{})
  end

  alias Utilshare.Payment.ExpenseInstance

  def list_expense_instances do
    Repo.all(ExpenseInstance)
  end

  def get_expense_instance!(id), do: Repo.get!(ExpenseInstance, id)

  def create_expense_instance(attrs \\ %{}) do
    %ExpenseInstance{}
    |> ExpenseInstance.changeset(attrs)
    |> Repo.insert()
  end

  def update_expense_instance(%ExpenseInstance{} = expense_instance, attrs) do
    expense_instance
    |> ExpenseInstance.changeset(attrs)
    |> Repo.update()
  end

  def delete_expense_instance(%ExpenseInstance{} = expense_instance) do
    Repo.delete(expense_instance)
  end

  def change_expense_instance(%ExpenseInstance{} = expense_instance) do
    ExpenseInstance.changeset(expense_instance, %{})
  end

  alias Utilshare.Payment.PaymentRequest

  def list_payment_requests do
    Repo.all(PaymentRequest)
  end

  def get_payment_request!(id), do: Repo.get!(PaymentRequest, id)
  def get_payment_requests_for_user(id) do
    PaymentRequest
    |> preload([:expense_instance, :requester, :requestee])
    |> where([r], r.requestee_id == ^id)
    |> Repo.all
  end

  def create_payment_request(attrs \\ %{}) do
    %PaymentRequest{}
    |> PaymentRequest.changeset(attrs)
    |> Repo.insert()
  end

  def update_payment_request(%PaymentRequest{} = payment_request, attrs) do
    payment_request
    |> PaymentRequest.changeset(attrs)
    |> Repo.update()
  end

  def delete_payment_request(%PaymentRequest{} = payment_request) do
    Repo.delete(payment_request)
  end

  def change_payment_request(%PaymentRequest{} = payment_request) do
    PaymentRequest.changeset(payment_request, %{})
  end
end
