defmodule Utilshare.TokenRefreshTask do
  use Task

  def start_link(expires_in) do
    Task.start_link(__MODULE__, :run, [expires_in])
  end

  def run(expires_in) do
    IO.puts "Got token expiring in: " <> Integer.to_string(expires_in)
    #Sleep for the duration of token less 5 minutes
    IO.puts "Sleeping For: " <> Integer.to_string(expires_in-((60*5)))
    Process.sleep(1000*(expires_in-((60*5))))
    auth = Utilshare.Accounts.Dwolla.authenticate_server()
    IO.puts "New Auth Info"
    IO.inspect auth
    GenServer.call(Utilshare.TokenManager, {:put, :auth, auth})
  end
end