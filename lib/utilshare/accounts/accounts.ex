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

  @doc """
  Returns the list of households.

  ## Examples

      iex> list_households()
      [%Household{}, ...]

  """
  def list_households do
    Repo.all(Household)
  end

  @doc """
  Gets a single household.

  Raises `Ecto.NoResultsError` if the Household does not exist.

  ## Examples

      iex> get_household!(123)
      %Household{}

      iex> get_household!(456)
      ** (Ecto.NoResultsError)

  """
  def get_household!(id), do: Repo.get!(Household, id)

  @doc """
  Creates a household.

  ## Examples

      iex> create_household(%{field: value})
      {:ok, %Household{}}

      iex> create_household(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_household(attrs \\ %{}) do
    %Household{}
    |> Household.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a household.

  ## Examples

      iex> update_household(household, %{field: new_value})
      {:ok, %Household{}}

      iex> update_household(household, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_household(%Household{} = household, attrs) do
    household
    |> Household.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Household.

  ## Examples

      iex> delete_household(household)
      {:ok, %Household{}}

      iex> delete_household(household)
      {:error, %Ecto.Changeset{}}

  """
  def delete_household(%Household{} = household) do
    Repo.delete(household)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking household changes.

  ## Examples

      iex> change_household(household)
      %Ecto.Changeset{source: %Household{}}

  """
  def change_household(%Household{} = household) do
    Household.changeset(household, %{})
  end
end
