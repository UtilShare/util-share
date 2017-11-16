defmodule UtilshareWeb.ExpenseInstanceView do
  use UtilshareWeb, :view
  alias UtilshareWeb.ExpenseInstanceView

  def render("index.json", %{expense_instances: expense_instances}) do
    render_many(expense_instances, ExpenseInstanceView, "expense_instance.json")
  end

  def render("show.json", %{expense_instance: expense_instance}) do
   render_one(expense_instance, ExpenseInstanceView, "expense_instance.json")
  end

  def render("expense_instance.json", %{expense_instance: expense_instance}) do
    %{id: expense_instance.id,
      note: expense_instance.note,
      complete: expense_instance.complete,
      amount: expense_instance.amount,
      created_at: expense_instance.inserted_at
    }
  end
end
