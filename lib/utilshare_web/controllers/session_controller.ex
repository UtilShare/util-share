defmodule UtilshareWeb.SessionController do
  use UtilshareWeb, :controller

  alias Utilshare.Accounts
  alias Utilshare.Accounts.Session
  alias Utilshare.Config

  action_fallback UtilshareWeb.FallbackController

  def create(conn, %{"login" => session_params}) do
    user = Utilshare.Accounts.get_user_by_email(session_params["email"])
    if user do
      user_for_token = %{
        id: user.id,
        dwolla_id: user.dwolla_id,
        email: user.email,
        first: user.first,
        last: user.last 
      }

      token = Phoenix.Token.sign(UtilshareWeb.Endpoint, Config.jwt_hash, userForToken)
      conn
      |> put_status(201)
      |> render("success.json", jwt: token, user: user)
    else
      conn
      |> put_status(403)
      |> render("error.json", error: "No user found matching login")
    end
  end
end
