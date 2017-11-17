defmodule UtilshareWeb.SessionController do
  use UtilshareWeb, :controller

  alias Utilshare.Accounts
  alias Utilshare.Accounts.Session
  alias Utilshare.Config

  action_fallback UtilshareWeb.FallbackController

  def create(conn, %{"login" => session_params}) do
    user = Utilshare.Accounts.get_user_by_email(session_params["email"])
    userForToken = %{
      id: user.id,
      dwolla_id: user.dwolla_id,
      email: user.email,
      first: user.first,
      last: user.last 
    }
    IO.inspect userForToken

    token = Phoenix.Token.sign(UtilshareWeb.Endpoint, Config.jwt_hash, userForToken)
    conn
    |> put_status(201)
    |> render("success.json", jwt: token, user: user)
  end
end
