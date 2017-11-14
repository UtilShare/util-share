defmodule Utilshare.AccountsTest do
  use Utilshare.DataCase

  alias Utilshare.Accounts

  # describe "users" do
  #   alias Utilshare.Accounts.User

  #   @valid_attrs %{dwolla_id: "some dwolla_id", email: "some email", first: "some first", last: "some last"}
  #   @update_attrs %{dwolla_id: "some updated dwolla_id", email: "some updated email", first: "some updated first", last: "some updated last"}
  #   @invalid_attrs %{dwolla_id: nil, email: nil, first: nil, last: nil}

  #   def user_fixture(attrs \\ %{}) do
  #     {:ok, user} =
  #       attrs
  #       |> Enum.into(@valid_attrs)
  #       |> Accounts.create_user()

  #     user
  #   end

  #   test "list_users/0 returns all users" do
  #     user = user_fixture()
  #     assert Accounts.list_users() == [user]
  #   end

  #   test "get_user!/1 returns the user with given id" do
  #     user = user_fixture()
  #     assert Accounts.get_user!(user.id) == user
  #   end

  #   test "create_user/1 with valid data creates a user" do
  #     assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
  #     assert user.dwolla_id == "some dwolla_id"
  #     assert user.email == "some email"
  #     assert user.first == "some first"
  #     assert user.last == "some last"
  #   end

  #   test "create_user/1 with invalid data returns error changeset" do
  #     assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
  #   end

  #   test "update_user/2 with valid data updates the user" do
  #     user = user_fixture()
  #     assert {:ok, user} = Accounts.update_user(user, @update_attrs)
  #     assert %User{} = user
  #     assert user.dwolla_id == "some updated dwolla_id"
  #     assert user.email == "some updated email"
  #     assert user.first == "some updated first"
  #     assert user.last == "some updated last"
  #   end

  #   test "update_user/2 with invalid data returns error changeset" do
  #     user = user_fixture()
  #     assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
  #     assert user == Accounts.get_user!(user.id)
  #   end

  #   test "delete_user/1 deletes the user" do
  #     user = user_fixture()
  #     assert {:ok, %User{}} = Accounts.delete_user(user)
  #     assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
  #   end

  #   test "change_user/1 returns a user changeset" do
  #     user = user_fixture()
  #     assert %Ecto.Changeset{} = Accounts.change_user(user)
  #   end
  # end
end
