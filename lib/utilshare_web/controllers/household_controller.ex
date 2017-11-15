defmodule UtilshareWeb.HouseholdController do
  use UtilshareWeb, :controller

  alias Utilshare.Accounts
  alias Utilshare.Accounts.Household

  action_fallback UtilshareWeb.FallbackController


  def create(conn, %{"household" => household_params}) do
    IO.puts "Auth"
    IO.inspect conn.assigns.auth
    with {:ok, %Household{} = household} <- Accounts.create_household(household_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", household_path(conn, :show, household))
      |> render("show.json", household: household)
    end
  end

  def show(conn, %{"id" => id}) do
    household = Accounts.get_household!(id)
    render(conn, "show.json", household: household)
  end
end
