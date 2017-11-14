defmodule Utilshare.Config do
  def token do
    GenServer.call(Utilshare.TokenManager, {:get, :token})
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
end