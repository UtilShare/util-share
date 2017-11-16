defmodule UtilshareWeb.SessionController do
  use UtilshareWeb, :controller

  alias Utilshare.Accounts
  alias Utilshare.Accounts.Session
  alias Utilshare.Config

  action_fallback UtilshareWeb.FallbackController

  def create(conn, %{"login" => session_params}) do
    user = Utilshare.Accounts.get_user_by_email(session_params["email"])
    token = Phoenix.Token.sign(UtilshareWeb.Endpoint, Config.jwt_hash, Map.from_struct(user))
    conn
    |> put_status(201)
    |> render("success.json", token, user)
  end
end
