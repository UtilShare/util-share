defmodule UtilshareWeb.ExpenseController do
    use UtilshareWeb, :controller
    import UtilshareWeb.Plugs

    plug :authorized

    alias Utilshare.Payment
    alias Utilshare.Payment.Expense

    action_fallback UtilshareWeb.FallbackController

    def show(conn, %{"id" => id}) do
        expense = Payment.get_expense!(id)
        render(conn, "show.json", expense: expense)
    end

    def create(conn, %{"expense" => expense_params}) do
      with {:ok, %Expense{} = expense} <- Payment.create_expense(expense_params) do
        conn
        |> put_status(:created)
        |> put_resp_header("location", expense_path(conn, :show, expense))
        |> render("show.json", expense: expense)
      end
    end

end
