defmodule UtilshareWeb.Plugs do
  import Plug.Conn
  require Logger

  def set_auth(conn, _opts) do
    auth = get_req_header(conn, "authorization")
    IO.inspect auth
    auth = List.first(auth)
    %{"token" => auth} = Regex.named_captures(~r/Bearer (?<token>.*)/i, auth)
    case Phoenix.Token.verify(UtilshareWeb.Endpoint, Utilshare.Config.jwt_hash, auth, max_age: 86400) do
      {:ok, user} ->
        IO.inspect user
        assign(conn, :auth, user)
      {:error, _} ->
        assign(conn, :auth, nil)
    end
  end
end