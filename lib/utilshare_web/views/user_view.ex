defmodule UtilshareWeb.UserView do
  use UtilshareWeb, :view
  alias UtilshareWeb.UserView
  alias UtilshareWeb.HouseholdView
  alias Utilshare.Repo

  def render("index.json", %{users: users}) do
    render_many(users, UserView, "user.json")
  end

  def render("show.json", %{user: user}) do
    base = render_one(user, UserView, "user.json")

    user = Repo.preload(user, :households)
    households = HouseholdView.render("index.json", households: user.households)

    Map.put(base, :households, households)
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      first: user.first,
      last: user.last,
      email: user.email,
      dwolla_id: user.dwolla_id,
      bank_id: user.bank_funding_source_id,
      balance_id: user.balance_funding_source_id
    }
  end
end
