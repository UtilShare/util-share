defmodule UtilshareWeb.ExpenseView do
  use UtilshareWeb, :view
  alias UtilshareWeb.ExpenseView

  def render("index.json", %{expenses: expenses}) do
    render_many(expenses, ExpenseView, "expense.json")
  end

  def render("show.json", %{expense: expense}) do
   render_one(expense, ExpenseView, "expense.json")
  end

  def render("expense.json", %{expense: expense}) do
    %{id: expense.id,
      desc: expense.desc,
      name: expense.name
      household: expense.household_id,
      owner_id: expense.owner_id,
    }
  end
end
