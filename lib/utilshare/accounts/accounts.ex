defmodule Utilshare.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Utilshare.Repo

  alias Utilshare.Accounts.User

  def list_users do
    Repo.all(User)
  end

  def get_user!(id), do: Repo.get!(User, id)

  
  def get_user_by_email(email) do
    from(s in User, where: s.email == ^email)
    |> Repo.one!
  end

  def create_user(attrs \\ %{}) do
    attrs = User.dwolla_user_verification(attrs)
    IO.inspect attrs
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end


  alias Utilshare.Accounts.Household

  def list_households do
    Repo.all(Household)
  end

  def get_household!(id), do: Repo.get!(Household, id)

  def create_household(attrs \\ %{}) do
    %Household{}
    |> Household.changeset(attrs)
    |> Repo.insert()
  end

  def update_household(%Household{} = household, attrs) do
    household
    |> Household.changeset(attrs)
    |> Repo.update()
  end

  def delete_household(%Household{} = household) do
    Repo.delete(household)
  end

  def change_household(%Household{} = household) do
    Household.changeset(household, %{})
  end

  alias Utilshare.Accounts.Roommate

  def list_roomates do
    Repo.all(Roommate)
  end

  def get_roommate!(id), do: Repo.get!(Roommate, id)

  def create_roommate(attrs \\ %{}) do
    %Roommate{}
    |> Roommate.changeset(attrs)
    |> Repo.insert()
  end

  def update_roommate(%Roommate{} = roommate, attrs) do
    roommate
    |> Roommate.changeset(attrs)
    |> Repo.update()
  end

  def delete_roommate(%Roommate{} = roommate) do
    Repo.delete(roommate)
  end

  def change_roommate(%Roommate{} = roommate) do
    Roommate.changeset(roommate, %{})
  end

end
