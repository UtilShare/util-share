defmodule Utilshare.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Utilshare.Accounts.User


  schema "users" do
    field :dwolla_id, :string
    field :email, :string
    field :first, :string
    field :last, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:first, :last, :email, :dwolla_id])
    |> validate_required([:first, :last, :email, :dwolla_id])
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
