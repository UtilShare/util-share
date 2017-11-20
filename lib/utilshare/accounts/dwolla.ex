defmodule Utilshare.Accounts.Dwolla do
alias Utilshare.Config, as: Config
alias Utilshare.Accounts
alias Decimal, as: D
import Logger

  def authenticate_server() do
    Logger.info(Config.auth_url)
    Logger.info(Config.api_key)
    Logger.info(Config.api_secret)
    IO.puts(Config.auth_url)
    IO.puts(Config.api_key)
    IO.puts(Config.api_secret)

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
    user = %{ firstName: user["first"],
              lastName: user["last"],
              email: user["email"],
              address1: user["address"],
              city: user["city"],
              state: user["state"],
              postalCode: user["zip"],
              dateOfBirth: user["dob"],
              ssn: user["ssn"],
              ip: user["ip"],
              type: "personal"
             }
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
  def fetch_funding_sources(user) do
    headers = ["Authorization": "Bearer #{Config.token}",
    "Content-Type": "application/vnd.dwolla.v1.hal+json",
    "Accept": "application/vnd.dwolla.v1.hal+json"]

    case HTTPoison.get("#{Config.api_url}/customers/#{user.dwolla_id}/funding-sources", headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        %{"_embedded" => sources} = Poison.decode!(body)
        bank = Enum.find(sources["funding-sources"],nil, fn x -> x["type"] == "bank" end)["id"]
        balance = Enum.find(sources["funding-sources"],nil, fn x -> x["type"] == "balance" end)["id"]
        user = Accounts.get_user!(user.id)
        {:ok, user} = Accounts.update_user(user, %{"balance_funding_source_id" => balance, "bank_funding_source_id" => bank})
        user
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end
  end

  def get_instant_account_verification_token(user) do
    headers = ["Authorization": "Bearer #{Config.token}",
               "Content-Type": "application/vnd.dwolla.v1.hal+json",
               "Accept": "application/vnd.dwolla.v1.hal+json"]
    case HTTPoison.post("#{Config.api_url}/customers/#{user.dwolla_id}/iav-token", "", headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        %{"token" => token} = Poison.decode!(body)
        token
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end

  end

  def pay_request(request_id) do
    request = Utilshare.Payment.get_payment_request_full!(request_id)
    headers = ["Authorization": "Bearer #{Config.token}",
    "Content-Type": "application/vnd.dwolla.v1.hal+json",
    "Accept": "application/vnd.dwolla.v1.hal+json"]
    
    IO.inspect request

    dest = Utilshare.Repo.preload(request.expense_instance, [expense: :owner])

    body = %{_links: %{
              source: %{href: "#{Config.api_url}/funding-sources/#{request.requestee.bank_funding_source_id}"},
              destination: %{href: "#{Config.api_url}/funding-sources/#{dest.expense.owner.balance_funding_source_id}"}
            },
            amount: %{
              currency: "USD",
              value: Float.to_string((request.percent/100)*D.to_float(request.expense_instance.amount))
            }
          }
    {:ok, body} = Poison.encode(body)
    IO.puts body

    case HTTPoison.post("#{Config.api_url}/transfers", body, headers) do
      {:ok, %HTTPoison.Response{status_code: 201, headers: headers}} ->
        new_transaction_url = get_header(headers, "Location")
        %{"id" => id } = Regex.named_captures(~r/transfers\/(?<id>.*)/, new_transaction_url)
        {:ok, req} = Utilshare.Payment.update_payment_request(request, %{"transaction_id" => id, "paid_at" => DateTime.utc_now })
        req
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end
    
  end

end
