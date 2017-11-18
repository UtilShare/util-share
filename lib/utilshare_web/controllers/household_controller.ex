defmodule UtilshareWeb.HouseholdController do
  use UtilshareWeb, :controller
  import UtilshareWeb.Plugs

  plug :authorized

  alias Utilshare.Accounts
  alias Utilshare.Accounts.Household

  action_fallback UtilshareWeb.FallbackController


  def create(conn, %{"household" => household_params}) do
    with {:ok, %Household{} = household} <- Accounts.create_household(household_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", household_path(conn, :show, household))
      |> render("household.json", household: household)
    end
  end

  def add_users(conn, %{"id" => id,"user_emails" => users}) do
    users = [conn.assigns.auth.email | users]
    Accounts.add_roommates_to_household(id, users)
    render(conn, "household.json", household: Accounts.get_household!(id))
  end

  def show(conn, %{"id" => id}) do
    household = Accounts.get_household!(id)
    render(conn, "show.json", household: household)
  end
end
