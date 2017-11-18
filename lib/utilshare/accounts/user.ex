defmodule Utilshare.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  use Coherence.Schema

  alias Utilshare.Accounts.User
  alias Utilshare.Accounts.Roommate

  schema "users" do
    field :dwolla_id, :string
    field :email, :string
    field :first, :string
    field :last, :string
    coherence_schema()

    has_many :expenses, Utilshare.Payment.Expense, [foreign_key: :owner_id]
    has_many :household_memberships, Roommate, foreign_key: :user_id, on_delete: :delete_all
    has_many :households, through: [:household_memberships, :household]
    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:first, :last, :email, :dwolla_id, :password, :password_confirmation])
    |> validate_required([:first, :last, :email, :dwolla_id])
    |> validate_coherence(attrs)
  end
  #Expects string based dictionary
  def dwolla_user_verification(user) do
    id = ""
    if(not(Map.has_key?(user, "dwolla_id"))) do
      id = Utilshare.Accounts.Dwolla.create_customer(user)
      IO.inspect id
    end
    user = Map.put(user, "dwolla_id", id)
    IO.inspect user
    user
  end
end
