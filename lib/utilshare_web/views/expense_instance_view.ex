defmodule UtilshareWeb.ExpenseInstanceView do
  use UtilshareWeb, :view
  alias UtilshareWeb.ExpenseInstanceView
  alias Utilshare.Repo

  def render("index.json", %{expense_instances: expense_instances}) do
    render_many(expense_instances, ExpenseInstanceView, "expense_instance.json")
  end


  def render("with_expense.json", %{expense_instance: expense_instance}) do
    expense_instance = Repo.preload(expense_instance, :expense)
    %{id: expense_instance.id,
      note: expense_instance.note,
      complete: expense_instance.complete,
      amount: expense_instance.amount,
      created_at: expense_instance.inserted_at,
      expense: UtilshareWeb.ExpenseView.render("show.json", %{expense: expense_instance.expense})
    }
  end

  def render("show.json", %{expense_instance: expense_instance}) do
   render_one(expense_instance, ExpenseInstanceView, "expense_instance.json")
  end

  def render("expense_instance.json", %{expense_instance: expense_instance}) do
    %{id: expense_instance.id,
      note: expense_instance.note,
      complete: expense_instance.complete,
      amount: expense_instance.amount,
      created_at: expense_instance.inserted_at,
      splits: UtilshareWeb.PaymentRequestView.render("simple.json", %{payment_requests: expense_instance.splits})
    }
  end

  def render("created.json", %{expense_instance: expense_instance, splits: splits}) do
    %{id: expense_instance.id,
    note: expense_instance.note,
    complete: expense_instance.complete,
    amount: expense_instance.amount,
    created_at: expense_instance.inserted_at,
    splits: UtilshareWeb.PaymentRequestView.render("simple.json", %{payment_requests: splits})
  }
  end

end
