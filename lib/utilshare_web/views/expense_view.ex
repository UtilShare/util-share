defmodule UtilshareWeb.ExpenseView do
  use UtilshareWeb, :view
  alias UtilshareWeb.ExpenseView
  alias UtilshareWeb.UserView
  alias UtilshareWeb.HouseholdView
  alias UtilshareWeb.ExpenseInstanceView
  alias Utilshare.Repo

  def render("index.json", %{expenses: expenses}) do
    render_many(expenses, ExpenseView, "expense.json")
  end

  def render("show.json", %{expense: expense}) do
   render_one(expense, ExpenseView, "expense.json")
  end

  def render("expense.json", %{expense: expense}) do
    expense = Repo.preload(expense, [instances: :splits])
    expense = Repo.preload(expense, :household)
    expense = Repo.preload(expense, :owner)
    %{
      id: expense.id,
      desc: expense.desc,
      name: expense.name,
      household: HouseholdView.render("show.json", household: expense.household),
      owner: UserView.render("user.json", user: expense.owner),
      instances: ExpenseInstanceView.render("index.json", expense_instances: expense.instances)
    }
  end
end
