defmodule UtilshareWeb.FundingSourceController do
  use UtilshareWeb, :controller
  import UtilshareWeb.Plugs
  
  plug :authorized

  alias Utilshare.Accounts

  action_fallback UtilshareWeb.FallbackController

  #get one time use token for dwolla
  def index(conn, _params) do
    token = Accounts.Dwolla.get_instant_account_verification_token(conn.assigns.auth)
    render(conn, "funding_source.json", %{token: token})
  end

  def create(conn, %{}) do
    user = Accounts.Dwolla.fetch_funding_sources(conn.assigns.auth)
    render(conn, "updated_user.json", %{user: user})
  end
end
