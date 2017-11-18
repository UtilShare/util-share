defmodule UtilshareWeb.SessionController do
  use UtilshareWeb, :controller
  use Coherence.Config

  alias Utilshare.Accounts
  alias Utilshare.Accounts.Session

  action_fallback UtilshareWeb.FallbackController

  def create(conn, %{"login" => session_params}) do
    user_schema = Config.user_schema()
    user = Utilshare.Accounts.get_user_by_email(session_params["email"])
    password = sesssion_params["password"]
    if user && user_schema.checkpw(password, Map.get(user, Config.password_hash()) do
      user_for_token = %{
        id: user.id,
        dwolla_id: user.dwolla_id,
        email: user.email,
        first: user.first,
        last: user.last 
      }

      token = Phoenix.Token.sign(UtilshareWeb.Endpoint, Config.jwt_hash, user_for_token)
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
