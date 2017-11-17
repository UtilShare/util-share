defmodule UtilshareWeb.SessionView do
  use UtilshareWeb, :view
  alias UtilshareWeb.SessionView
  alias UtilshareWeb.UserView

  def render("index.json", %{sessions: sessions}) do
    %{data: render_many(sessions, SessionView, "session.json")}
  end

  def render("show.json", %{session: session}) do
    %{data: render_one(session, SessionView, "session.json")}
  end

  def render("success.json", %{jwt: jwt, user: user}) do
    %{
      jwt: jwt,
      user: UserView.render("show.json", user: user)
    }
  end

  def render("error.json", %{error: reason}) do
    %{error: reason.id}
  end
end
