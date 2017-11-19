defmodule UtilshareWeb.FundingSourceView do
  use UtilshareWeb, :view
  alias UtilshareWeb.FundingSourceView

  def render("index.json", %{funding_sources: funding_sources}) do
    %{data: render_many(funding_sources, FundingSourceView, "funding_source.json")}
  end

  def render("show.json", %{funding_source: funding_source}) do
    %{data: render_one(funding_source, FundingSourceView, "funding_source.json")}
  end

  def render("updated_user.json", %{user: user}) do
    UtilshareWeb.UserView.render("show.json", %{user: user})
  end

  def render("funding_source.json", %{token: token}) do
    %{token: token}
  end
end