defmodule UtilshareWeb.PaymentRequestView do
  use UtilshareWeb, :view
  alias UtilshareWeb.PaymentRequestView
  alias UtilshareWeb.PaymentRequest

  def render("index.json", %{payment_requests: payment_requests}) do
    render_many(payment_requests, PaymentRequestView, "expense_instance.json")
  end

  def render("show.json", %{payment_request: payment_request}) do
   render_one(payment_request, PaymentRequestView, "expense_instance.json")
  end

  def render("expense_instance.json", %{payment_request: payment_request}) do
    %{
      id: payment_request.id,
      percent: payment_request.percent,
      requestee: UtilshareWeb.UserView.render("user.json",%{user: payment_request.requestee}),
      expense_instance: UtilshareWeb.ExpenseInstanceView.render("show.json", %{expense_instance: payment_request.expense_instance}),
      paid_at: payment_request.paid_at
    }
  end
end
