# defmodule Utilshare.PaymentTest do
#   use Utilshare.DataCase

#   alias Utilshare.Payment

#   describe "expense_instances" do
#     alias Utilshare.Payment.ExpenseInstance

#     @valid_attrs %{complete: true, note: "some note"}
#     @update_attrs %{complete: false, note: "some updated note"}
#     @invalid_attrs %{complete: nil, note: nil}

#     def expense_instance_fixture(attrs \\ %{}) do
#       {:ok, expense_instance} =
#         attrs
#         |> Enum.into(@valid_attrs)
#         |> Payment.create_expense_instance()

#       expense_instance
#     end

#     test "list_expense_instances/0 returns all expense_instances" do
#       expense_instance = expense_instance_fixture()
#       assert Payment.list_expense_instances() == [expense_instance]
#     end

#     test "get_expense_instance!/1 returns the expense_instance with given id" do
#       expense_instance = expense_instance_fixture()
#       assert Payment.get_expense_instance!(expense_instance.id) == expense_instance
#     end

#     test "create_expense_instance/1 with valid data creates a expense_instance" do
#       assert {:ok, %ExpenseInstance{} = expense_instance} = Payment.create_expense_instance(@valid_attrs)
#       assert expense_instance.complete == true
#       assert expense_instance.note == "some note"
#     end

#     test "create_expense_instance/1 with invalid data returns error changeset" do
#       assert {:error, %Ecto.Changeset{}} = Payment.create_expense_instance(@invalid_attrs)
#     end

#     test "update_expense_instance/2 with valid data updates the expense_instance" do
#       expense_instance = expense_instance_fixture()
#       assert {:ok, expense_instance} = Payment.update_expense_instance(expense_instance, @update_attrs)
#       assert %ExpenseInstance{} = expense_instance
#       assert expense_instance.complete == false
#       assert expense_instance.note == "some updated note"
#     end

#     test "update_expense_instance/2 with invalid data returns error changeset" do
#       expense_instance = expense_instance_fixture()
#       assert {:error, %Ecto.Changeset{}} = Payment.update_expense_instance(expense_instance, @invalid_attrs)
#       assert expense_instance == Payment.get_expense_instance!(expense_instance.id)
#     end

#     test "delete_expense_instance/1 deletes the expense_instance" do
#       expense_instance = expense_instance_fixture()
#       assert {:ok, %ExpenseInstance{}} = Payment.delete_expense_instance(expense_instance)
#       assert_raise Ecto.NoResultsError, fn -> Payment.get_expense_instance!(expense_instance.id) end
#     end

#     test "change_expense_instance/1 returns a expense_instance changeset" do
#       expense_instance = expense_instance_fixture()
#       assert %Ecto.Changeset{} = Payment.change_expense_instance(expense_instance)
#     end
#   end

#   describe "payment_requests" do
#     alias Utilshare.Payment.PaymentRequest

#     @valid_attrs %{percent: 42}
#     @update_attrs %{percent: 43}
#     @invalid_attrs %{percent: nil}

#     def payment_request_fixture(attrs \\ %{}) do
#       {:ok, payment_request} =
#         attrs
#         |> Enum.into(@valid_attrs)
#         |> Payment.create_payment_request()

#       payment_request
#     end

#     test "list_payment_requests/0 returns all payment_requests" do
#       payment_request = payment_request_fixture()
#       assert Payment.list_payment_requests() == [payment_request]
#     end

#     test "get_payment_request!/1 returns the payment_request with given id" do
#       payment_request = payment_request_fixture()
#       assert Payment.get_payment_request!(payment_request.id) == payment_request
#     end

#     test "create_payment_request/1 with valid data creates a payment_request" do
#       assert {:ok, %PaymentRequest{} = payment_request} = Payment.create_payment_request(@valid_attrs)
#       assert payment_request.percent == 42
#     end

#     test "create_payment_request/1 with invalid data returns error changeset" do
#       assert {:error, %Ecto.Changeset{}} = Payment.create_payment_request(@invalid_attrs)
#     end

#     test "update_payment_request/2 with valid data updates the payment_request" do
#       payment_request = payment_request_fixture()
#       assert {:ok, payment_request} = Payment.update_payment_request(payment_request, @update_attrs)
#       assert %PaymentRequest{} = payment_request
#       assert payment_request.percent == 43
#     end

#     test "update_payment_request/2 with invalid data returns error changeset" do
#       payment_request = payment_request_fixture()
#       assert {:error, %Ecto.Changeset{}} = Payment.update_payment_request(payment_request, @invalid_attrs)
#       assert payment_request == Payment.get_payment_request!(payment_request.id)
#     end

#     test "delete_payment_request/1 deletes the payment_request" do
#       payment_request = payment_request_fixture()
#       assert {:ok, %PaymentRequest{}} = Payment.delete_payment_request(payment_request)
#       assert_raise Ecto.NoResultsError, fn -> Payment.get_payment_request!(payment_request.id) end
#     end

#     test "change_payment_request/1 returns a payment_request changeset" do
#       payment_request = payment_request_fixture()
#       assert %Ecto.Changeset{} = Payment.change_payment_request(payment_request)
#     end
#   end
# end
