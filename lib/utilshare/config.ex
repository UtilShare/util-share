defmodule Utilshare.Config do
  import Logger
  def token do
    token = GenServer.call(Utilshare.TokenManager, {:get, :token})
    Logger.info "======= Giving Token "<>token<>" To Dwolla ==========="
    token
  end
  def api_url do
    Application.get_env(:utilshare, :api_url)
  end
  def auth_url do
    Application.get_env(:utilshare, :auth_url)
  end
  def api_key do
    Application.get_env(:utilshare, :key)
  end
  def api_secret do
    Application.get_env(:utilshare, :secret)
  end
  def jwt_hash do
    Application.get_env(:utilshare, :jwt_hash)
  end
end