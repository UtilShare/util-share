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
      with {:ok, %ExpenseInstance{} = expense_instance} <- Payment.create_expense_instance(expense_instance_params) do
        #once the instance is inserted, add requests for each user in the household for the requesite amount
        splits = Enum.map(expense_instance_params["splits"], fn member ->
          member = Map.put(member, "expense_instance_id", expense_instance.id)
          {:ok, member} = Payment.create_payment_request(member)
          member
        end)

        conn
        |> put_status(:created)
        |> put_resp_header("location", expense_instance_path(conn, :show, expense_instance))
        |> render("created.json", expense_instance: expense_instance, splits: splits)
      end
    end

end