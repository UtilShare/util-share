defmodule Utilshare.Accounts.Dwolla do
    def getAccountDetails(auth) do
        auth = Poison.decode!(auth)
        headers = ["Authorization": "Bearer "<>auth["access_token"],
                   "Accept": "application/vnd.dwolla.v1.hal+json"]
        url = auth["_links"]["account"]["href"]
        case HTTPoison.get(url, headers) do
          {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
            body
          {:error, %HTTPoison.Error{reason: reason}} ->
            IO.inspect(reason)
        end
      end
    
      def getAuthToken(code) do
        key = Application.get_env(:utilshare, :key)
        secret = Application.get_env(:utilshare, :secret)
        body = {:form, 
          [
            client_id: key,
            client_secret: secret, #withheld
            grant_type: "authorization_code",
            redirect_url: "http://localhost:4000/auth/redirect",
            code: code
        ]}
        
        case HTTPoison.post("https://sandbox.dwolla.com/oauth/v2/token", body, %{"Content-type" => "application/x-www-form-urlencoded"}) do
          {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
            body
          {:error, %HTTPoison.Error{reason: reason}} ->
            IO.inspect(reason)
        end
      end
end