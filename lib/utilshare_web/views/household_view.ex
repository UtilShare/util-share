defmodule UtilshareWeb.HouseholdView do
  use UtilshareWeb, :view
  alias UtilshareWeb.HouseholdView

  def render("index.json", %{households: households}) do
    render_many(households, HouseholdView, "household.json")
  end

  def render("show.json", %{household: household}) do
   render_one(household, HouseholdView, "household.json")
  end

  def render("household.json", %{household: household}) do
    %{id: household.id,
      name: household.name}
  end
end
