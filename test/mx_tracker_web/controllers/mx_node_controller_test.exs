defmodule MxTrackerWeb.MxNodeControllerTest do
  use MxTrackerWeb.ConnCase

  alias MxTracker.Admin

  @create_attrs %{name: "some name", node_type: "some node_type", url: "some url", node_uuid: "456"}
  @update_attrs %{name: "some updated name", node_type: "some updated node_type", url: "some updated url", node_uuid: "some updated uuid"}
  @invalid_attrs %{name: nil, node_type: nil, url: nil, uuid: nil}

  def fixture(:mx_node) do
    {:ok, mx_node} = Admin.create_mx_node(@create_attrs)
    mx_node
  end

  describe "index" do
    test "lists all mx_nodes", %{conn: conn} do
      conn = get conn, mx_node_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Mx nodes"
    end
  end

  describe "new mx_node" do
    test "renders form", %{conn: conn} do
      conn = get conn, mx_node_path(conn, :new)
      assert html_response(conn, 200) =~ "New Mx node"
    end
  end

  describe "create mx_node" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, mx_node_path(conn, :create), mx_node: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == mx_node_path(conn, :show, id)

      conn = get conn, mx_node_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Mx node"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, mx_node_path(conn, :create), mx_node: @invalid_attrs
      assert html_response(conn, 200) =~ "New Mx node"
    end
  end

  describe "edit mx_node" do
    setup [:create_mx_node]

    test "renders form for editing chosen mx_node", %{conn: conn, mx_node: mx_node} do
      conn = get conn, mx_node_path(conn, :edit, mx_node)
      assert html_response(conn, 200) =~ "Edit Mx node"
    end
  end

  describe "update mx_node" do
    setup [:create_mx_node]

    test "redirects when data is valid", %{conn: conn, mx_node: mx_node} do
      conn = put conn, mx_node_path(conn, :update, mx_node), mx_node: @update_attrs
      assert redirected_to(conn) == mx_node_path(conn, :show, mx_node)

      conn = get conn, mx_node_path(conn, :show, mx_node)
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, mx_node: mx_node} do
      conn = put conn, mx_node_path(conn, :update, mx_node), mx_node: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Mx node"
    end
  end

  describe "delete mx_node" do
    setup [:create_mx_node]

    test "deletes chosen mx_node", %{conn: conn, mx_node: mx_node} do
      conn = delete conn, mx_node_path(conn, :delete, mx_node)
      assert redirected_to(conn) == mx_node_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, mx_node_path(conn, :show, mx_node)
      end
    end
  end

  defp create_mx_node(_) do
    mx_node = fixture(:mx_node)
    {:ok, mx_node: mx_node}
  end
end
