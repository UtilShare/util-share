defmodule UtilshareWeb.UserView do
  use UtilshareWeb, :view
  alias UtilshareWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      first: user.first,
      last: user.last,
      email: user.email,
      dwolla_id: user.dwolla_id}
  end
end
