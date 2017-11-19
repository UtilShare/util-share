defmodule UtilshareWeb.PaymentRequestController do
    use UtilshareWeb, :controller
    import UtilshareWeb.Plugs
    alias Utilshare.Accounts

    plug :authorized

    alias Utilshare.Payment
    alias Utilshare.Payment.PaymentRequest

    action_fallback UtilshareWeb.FallbackController

    #Get requests for user
    def index(conn, _params) do
        payment_requests = Payment.get_payment_requests_for_user(conn.assigns.auth.id)
        render(conn, "index.json", payment_requests: payment_requests)
    end
    def pay(conn, %{"id" => id}) do
        Accounts.Dwolla.pay_request(id)
    end

end
