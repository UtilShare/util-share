defmodule UtilshareWeb.HouseholdView do
  use UtilshareWeb, :view
  alias UtilshareWeb.HouseholdView
  alias UtilshareWeb.UserView
  alias Utilshare.Repo

  def render("index.json", %{households: households}) do
    render_many(households, HouseholdView, "household.json")
  end

  def render("show.json", %{household: household}) do
    base = render_one(household, HouseholdView, "household.json")

    household = Repo.preload(household, :users)
    users = UserView.render("index.json", users: household.users)

    Map.put(base, :users, users)
  end

  def render("household.json", %{household: household}) do
    %{
      id: household.id,
      name: household.name
    }
  end
end
