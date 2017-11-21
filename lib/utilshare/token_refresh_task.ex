defmodule Utilshare.TokenRefreshTask do
  use Task
  import Logger

  def start_link(expires_in) do
    Task.start_link(__MODULE__, :run, [expires_in])
  end

  def run(expires_in) do
    Logger.info "Got token expiring in: " <> Integer.to_string(expires_in)
    #Sleep for the duration of token less 8 minutes
    minutes = 8

    Logger.info "Sleeping For: " <> Integer.to_string(expires_in-((60*minutes)))
    Process.sleep(1000*(expires_in-((60*minutes))))
    auth = Utilshare.Accounts.Dwolla.authenticate_server()
    Logger.info "New Auth Info"
    Logger.info(inspect(auth))
    GenServer.call(Utilshare.TokenManager, {:put, :auth, auth})
  end
end