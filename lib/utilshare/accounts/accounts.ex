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

end
