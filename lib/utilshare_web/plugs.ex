defmodule UtilshareWeb.Plugs do
  import Plug.Conn
  require Logger

  def set_auth(conn, _opts) do
    auth = get_req_header(conn, "authorization")
    auth = List.first(auth)
    case Regex.named_captures(~r/Bearer (?<token>.*)/i, auth || "") do
      %{"token" => auth} ->
        case Phoenix.Token.verify(UtilshareWeb.Endpoint, Utilshare.Config.jwt_hash, auth, max_age: 86400) do
          {:ok, user} ->
            IO.inspect user
            assign(conn, :auth, user)
          {:error, _} ->
            assign(conn, :auth, nil)
        end
      nil ->
        assign(conn, :auth, nil)
    end
  end

  def authorized(conn, _opts) do
    if(not(is_nil(conn.assigns.auth)))do
      conn
    else
      conn
      |> put_status(403) 
      |> send_resp(403, "Unauthorized")
      |> halt
    end

  end
end
