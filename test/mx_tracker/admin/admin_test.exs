defmodule MxTracker.AdminTest do
  use MxTracker.DataCase

  alias MxTracker.Admin

  describe "mx_nodes" do
    alias MxTracker.Admin.MxNode

    @valid_attrs %{name: "some name", node_type: "some node_type", url: "some url", node_uuid: "some_node_uuid"}
    @update_attrs %{name: "some updated name", node_type: "some updated node_type", url: "some updated url", node_uuid: "some_updated node_uuid"}
    @invalid_attrs %{name: nil, node_type: nil, url: nil}

    def mx_node_fixture(attrs \\ %{}) do
      {:ok, mx_node} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Admin.create_mx_node()

      mx_node
    end

    test "list_mx_nodes/0 returns all mx_nodes" do
      mx_node = mx_node_fixture()
      assert Admin.list_mx_nodes() == [mx_node]
    end

    test "get_mx_node!/1 returns the mx_node with given id" do
      mx_node = mx_node_fixture()
      assert Admin.get_mx_node!(mx_node.id) == mx_node
    end

    test "create_mx_node/1 with valid data creates a mx_node" do
      assert {:ok, %MxNode{} = mx_node} = Admin.create_mx_node(@valid_attrs)
      assert mx_node.name == "some name"
      assert mx_node.node_type == "some node_type"
      assert mx_node.url == "some url"
    end

    test "create_mx_node/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_mx_node(@invalid_attrs)
    end

    test "update_mx_node/2 with valid data updates the mx_node" do
      mx_node = mx_node_fixture()
      assert {:ok, mx_node} = Admin.update_mx_node(mx_node, @update_attrs)
      assert %MxNode{} = mx_node
      assert mx_node.name == "some updated name"
      assert mx_node.node_type == "some updated node_type"
      assert mx_node.url == "some updated url"
    end

    test "update_mx_node/2 with invalid data returns error changeset" do
      mx_node = mx_node_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_mx_node(mx_node, @invalid_attrs)
      assert mx_node == Admin.get_mx_node!(mx_node.id)
    end

    test "delete_mx_node/1 deletes the mx_node" do
      mx_node = mx_node_fixture()
      assert {:ok, %MxNode{}} = Admin.delete_mx_node(mx_node)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_mx_node!(mx_node.id) end
    end

    test "change_mx_node/1 returns a mx_node changeset" do
      mx_node = mx_node_fixture()
      assert %Ecto.Changeset{} = Admin.change_mx_node(mx_node)
    end
  end
end
