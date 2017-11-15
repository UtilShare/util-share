defmodule UtilshareWeb.HouseholdController do
  use UtilshareWeb, :controller

  alias Utilshare.Accounts
  alias Utilshare.Accounts.Household

  action_fallback UtilshareWeb.FallbackController


  def create(conn, %{"household" => household_params}) do
    household_params = Map.put(household_params, "owner_id",conn.assigns.auth.id)
    IO.inspect household_params
    with {:ok, %Household{} = household} <- Accounts.create_household(household_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", household_path(conn, :show, household))
      |> render("show.json", household: household)
    end
  end
  def add_users(conn, %{"id" => id,"users" => users}) do
    
  end

  def show(conn, %{"id" => id}) do
    household = Accounts.get_household!(id)
    render(conn, "show.json", household: household)
  end
end
