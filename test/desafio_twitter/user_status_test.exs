defmodule DesafioTwitter.UserStatusTest do
  use DesafioTwitter.DataCase

  alias DesafioTwitter.UserStatus

  describe "status" do
    alias DesafioTwitter.UserStatus.Status

    @valid_attrs %{status: "some status", user_id: "some user_id"}
    @update_attrs %{status: "some updated status", user_id: "some updated user_id"}
    @invalid_attrs %{status: nil, user_id: nil}

    def status_fixture(attrs \\ %{}) do
      {:ok, status} =
        attrs
        |> Enum.into(@valid_attrs)
        |> UserStatus.create_status()

      status
    end

    test "list_status/0 returns all status" do
      status = status_fixture()
      assert UserStatus.list_status() == [status]
    end

    test "get_status!/1 returns the status with given id" do
      status = status_fixture()
      assert UserStatus.get_status!(status.id) == status
    end

    test "create_status/1 with valid data creates a status" do
      assert {:ok, %Status{} = status} = UserStatus.create_status(@valid_attrs)
      assert status.status == "some status"
      assert status.user_id == "some user_id"
    end

    test "create_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = UserStatus.create_status(@invalid_attrs)
    end

    test "update_status/2 with valid data updates the status" do
      status = status_fixture()
      assert {:ok, %Status{} = status} = UserStatus.update_status(status, @update_attrs)
      assert status.status == "some updated status"
      assert status.user_id == "some updated user_id"
    end

    test "update_status/2 with invalid data returns error changeset" do
      status = status_fixture()
      assert {:error, %Ecto.Changeset{}} = UserStatus.update_status(status, @invalid_attrs)
      assert status == UserStatus.get_status!(status.id)
    end

    test "delete_status/1 deletes the status" do
      status = status_fixture()
      assert {:ok, %Status{}} = UserStatus.delete_status(status)
      assert_raise Ecto.NoResultsError, fn -> UserStatus.get_status!(status.id) end
    end

    test "change_status/1 returns a status changeset" do
      status = status_fixture()
      assert %Ecto.Changeset{} = UserStatus.change_status(status)
    end
  end
end
