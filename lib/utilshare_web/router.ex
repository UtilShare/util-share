defmodule UtilshareWeb.Router do
  use UtilshareWeb, :router
  import UtilshareWeb.Plugs
  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :set_auth
  end

  scope "/", UtilshareWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/auth/redirect", PageController, :redirect
  end

  # Other scopes may use custom stacks.
  scope "/api", UtilshareWeb do
    pipe_through :api
    resources "/users", UserController
    post "/sessions", SessionController, :create

    post "/households", HouseholdController, :create
    get "/households/:id", HouseholdController, :show
    patch "/households/:id", HouseholdController, :add_users

    get "/expenses/:id", ExpenseController, :show
    post "/expenses", ExpenseController, :create
    get "/expenses", ExpenseController, :index

    get "/expense_instances/:id", ExpenseInstanceController, :show
    post "/expense_instances", ExpenseInstanceController, :create

    get "/payment_requests", PaymentRequestController, :index

    post "/funding_sources", FundingSourceController, :create
    get "/funding_sources", FundingSourceController, :index
    
  end
end
