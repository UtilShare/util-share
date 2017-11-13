defmodule UtilshareWeb.PageController do
  use UtilshareWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
  

  def redirect(conn, _params) do
    code = _params["code"]
    if is_nil(code) do
      render(conn, "index.html")
    else
      auth = Dwolla.getAuthToken(code)
      accountDetails = Dwolla.getAccountDetails(auth)
      auth = Poison.decode!(auth)
      IO.inspect auth
      render(conn, "index.html", auth: auth, details: accountDetails)
    end
    
  end
end
