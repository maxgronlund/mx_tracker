defmodule MxTracker.TrackersTest do
  use MxTracker.DataCase

  alias MxTracker.Trackers
  alias MxTracker.Trackers.MxTracker

  describe "mx_trackers" do

    @valid_attrs %{ip: "some ip", name: "some name", url: "some url", key_id: "some key_id", access_key: "some access_key"}
    @update_attrs %{ip: "some updated ip", name: "some updated name", url: "some updated url", key_id: "some updated key_id", access_key: "some updated access_key"}
    @invalid_attrs %{ip: nil, name: nil, url: nil, key_id: nil}

    def mx_tracker_fixture(attrs \\ %{}) do
      {:ok, mx_tracker} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Trackers.create_mx_tracker()

      mx_tracker
    end

    test "list_mx_trackers/0 returns all mx_trackers" do
      mx_tracker = mx_tracker_fixture()
      assert Trackers.list_mx_trackers() == [mx_tracker]
    end

    test "get_mx_tracker!/1 returns the mx_tracker with given id" do
      mx_tracker = mx_tracker_fixture()
      assert Trackers.get_mx_tracker!(mx_tracker.id) == mx_tracker
    end

    test "create_mx_tracker/1 with valid data creates a mx_tracker" do
      assert {:ok, %MxTracker{} = mx_tracker} = Trackers.create_mx_tracker(@valid_attrs)
      assert mx_tracker.ip == "some ip"
      assert mx_tracker.name == "some name"
      assert mx_tracker.url == "some url"
      assert mx_tracker.key_id == "some key_id"
    end

    test "create_mx_tracker/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Trackers.create_mx_tracker(@invalid_attrs)
    end

    test "update_mx_tracker/2 with valid data updates the mx_tracker" do
      mx_tracker = mx_tracker_fixture()
      assert {:ok, mx_tracker} = Trackers.update_mx_tracker(mx_tracker, @update_attrs)
      assert %MxTracker{} = mx_tracker
      assert mx_tracker.ip == "some updated ip"
      assert mx_tracker.name == "some updated name"
      assert mx_tracker.url == "some updated url"
      assert mx_tracker.key_id == "some updated key_id"
      assert mx_tracker.access_key == "some updated access_key"
    end

    test "update_mx_tracker/2 with invalid data returns error changeset" do
      mx_tracker = mx_tracker_fixture()
      assert {:error, %Ecto.Changeset{}} = Trackers.update_mx_tracker(mx_tracker, @invalid_attrs)
      assert mx_tracker == Trackers.get_mx_tracker!(mx_tracker.id)
    end

    test "delete_mx_tracker/1 deletes the mx_tracker" do
      mx_tracker = mx_tracker_fixture()
      assert {:ok, %MxTracker{}} = Trackers.delete_mx_tracker(mx_tracker)
      assert_raise Ecto.NoResultsError, fn -> Trackers.get_mx_tracker!(mx_tracker.id) end
    end

    test "change_mx_tracker/1 returns a mx_tracker changeset" do
      mx_tracker = mx_tracker_fixture()
      assert %Ecto.Changeset{} = Trackers.change_mx_tracker(mx_tracker)
    end
  end
end
