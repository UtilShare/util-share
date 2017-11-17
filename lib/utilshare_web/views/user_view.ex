defmodule UtilshareWeb.UserView do
  use UtilshareWeb, :view
  alias UtilshareWeb.UserView
  alias UtilshareWeb.HouseholdView
  alias Utilshare.Repo

  def render("index.json", %{users: users}) do
    render_many(users, UserView, "user.json")
  end

  def render("show.json", %{user: user}) do
    render_one(user, UserView, "user.json")
  end

  def render("user.json", %{user: user}) do
    user = Repo.preload(user, :households)
    %{id: user.id,
      first: user.first,
      last: user.last,
      email: user.email,
      dwolla_id: user.dwolla_id,
      households: HouseholdView.render("index.json", households: user.households)
    }
  end
end
