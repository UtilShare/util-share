defmodule Utilshare.Accounts.Dwolla do
alias Utilshare.Config, as: Config

  def authenticate_server() do
    body = {:form, 
    [
      client_id: Config.api_key,
      client_secret: Config.api_secret,
      grant_type: "client_credentials",
    ]}
    case HTTPoison.post(Config.auth_url, body, %{"Content-Type" => "application/x-www-form-urlencoded"}) do
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
    headers = ["Authorization": "Bearer #{Config.token}",
               "Content-Type": "application/vnd.dwolla.v1.hal+json",
               "Accept": "application/vnd.dwolla.v1.hal+json"]
    user = %{ firstName: user["first"], lastName: user["last"], email: user["email"] }
    {:ok, body} = Poison.encode(user)
    IO.puts body
    case HTTPoison.post("#{Config.api_url}/customers",body,headers)do
      {:ok, %HTTPoison.Response{status_code: 201, headers: headers }} ->
        new_user_url = get_header(headers, "Location")
        %{"id" => id} = Regex.named_captures(~r/customers\/(?<id>.*)/, new_user_url)
        id
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end
  end
end