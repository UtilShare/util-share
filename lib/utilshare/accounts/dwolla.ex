defmodule Utilshare.Accounts.Dwolla do

  def token do
    GenServer.call(Utilshare.TokenManager, {:get, :token})
  end

  def authenticate_server() do
    body = {:form, 
    [
      client_id: Application.get_env(:utilshare, :key),
      client_secret: Application.get_env(:utilshare, :secret),
      grant_type: "client_credentials",
    ]}
    case HTTPoison.post("https://sandbox.dwolla.com/oauth/v2/token", body, %{"Content-type" => "application/x-www-form-urlencoded"}) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        auth = Poison.decode!(body)
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end
  end
  #From HttpPoison Tests
  #https://github.com/edgurgel/httpoison/blob/master/test/httpoison_test.exs
  def get_header(headers, key) do
    headers
    |> Enum.filter(fn({k, _}) -> k == key end)
    |> List.first
    |> elem(1)
  end

  def create_customer(user) do
    #Creates a verified user
    headers = ["Authorization": "Bearer "<>token,
               "Content-Type": "application/vnd.dwolla.v1.hal+json",
               "Accept": "application/vnd.dwolla.v1.hal+json"]
    user = %{ firstName: user["first"], lastName: user["last"], email: user["email"] }
    {:ok, body} = Poison.encode(user)
    IO.puts body
    case HTTPoison.post("https://api-sandbox.dwolla.com/customers",body,headers)do
      {:ok, %HTTPoison.Response{status_code: 201, headers: headers }} ->
        new_user_url = get_header(headers, "Location")
        %{"id" => id} = Regex.named_captures(~r/customers\/(?<id>.*)/, new_user_url)
        id
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end
  end


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
          client_secret: secret,
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