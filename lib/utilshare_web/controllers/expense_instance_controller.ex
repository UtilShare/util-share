defmodule UtilshareWeb.ExpenseInstanceController do
    use UtilshareWeb, :controller
    import UtilshareWeb.Plugs
  
    plug :authorized
  
    alias Utilshare.Payment
    alias Utilshare.Payment.ExpenseInstance
  
    action_fallback UtilshareWeb.FallbackController
  
    def show(conn, %{"id" => id}) do
        expense_instance = Payment.get_expense_instance!(id)
        render(conn, "show.json", expense_instance: expense_instance)
    end
  
    def create(conn, %{"expense_instance" => expense_instance_params}) do
      with {:ok, %ExpenseInstance{} = expense_instance} <- Payment.create_expense(expense_instance_params) do
        conn
        |> put_status(:created)
        |> put_resp_header("location", expense_instance_path(conn, :show, expense_instance))
        |> render("show.json", expense_instance: expense_instance)
      end
    end

end