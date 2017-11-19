defmodule Utilshare.TokenManager do
  use GenServer
  def start_link() do
    IO.puts "Env: "
    IO.inspect Mix.env
    state0 = %{}
    if(Mix.env != :test) do
      auth = Utilshare.Accounts.Dwolla.authenticate_server()
      IO.inspect auth
      Utilshare.TokenRefreshTask.start_link(auth["expires_in"])
      state0 = %{token: auth["access_token"]}
    end
    GenServer.start_link(__MODULE__, state0, name: __MODULE__)
  end

  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end

  def handle_call({:put, key, val}, _from, state) do
    if(key == :auth) do 
      token = val["access_token"]
      Map.put(state,:token, token)
      Utilshare.TokenRefreshTask.start_link(val["expires_in"])
    end

    {:reply, :ok, Map.put(state, key, val)}
  end
end