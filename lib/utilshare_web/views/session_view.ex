defmodule UtilshareWeb.SessionView do
  use UtilshareWeb, :view
  alias UtilshareWeb.SessionView

  def render("index.json", %{sessions: sessions}) do
    %{data: render_many(sessions, SessionView, "session.json")}
  end

  def render("show.json", %{session: session}) do
    %{data: render_one(session, SessionView, "session.json")}
  end

  def render("success.json", %{jwt: jwt}) do
    %{jwt: jwt}
  end
  def render("error.json", %{error: reason}) do
    %{error: reason.id}
  end
end
