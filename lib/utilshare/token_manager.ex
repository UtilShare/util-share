defmodule Utilshare.TokenManager do
  use GenServer
  import Logger
  def start_link() do
    state0 = %{}
    auth = Utilshare.Accounts.Dwolla.authenticate_server()
    Logger.info("AUTH"<>inspect(auth))
    Utilshare.TokenRefreshTask.start_link(auth["expires_in"])
    Logger.info("Set Init Token "<>auth["access_token"])
    state0 = %{token: auth["access_token"]}
    # end
    GenServer.start_link(__MODULE__, state0, name: __MODULE__)
  end

  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end

  def handle_call({:put, key, val}, _from, state) do
    if(key == :auth) do 
      token = val["access_token"]
      Logger.info("Setting new Token: "<>token)
      state = Map.put(state, :token, token)
      Utilshare.TokenRefreshTask.start_link(val["expires_in"])
      Logger.info("Done Setting Token: "<>token)
    end

    {:reply, :ok, Map.put(state, key, val)}
  end
end