defmodule MxTrackerWeb.MxTrackerControllerTest do
  use MxTrackerWeb.ConnCase

  alias MxTracker.Trackers
  alias MxTracker.Trackers.MxTracker

  @create_attrs %{ip: "some ip", url: "some url", name: "some name", key_id: "some key_id", access_key: "some access_key"}
  @update_attrs %{ip: "some updated ip", url: "some updated url", name: "some updated name", key_id: "some updated key_id", access_key: "some updated access_key"}
  @invalid_attrs %{ip: nil, name: nil, url: nil, key_id: nil, access_key: nil}

  def fixture(:mx_tracker) do
    {:ok, mx_tracker} = Trackers.create_mx_tracker(@create_attrs)
    mx_tracker
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all mx_trackers", %{conn: conn} do
      conn = get conn, mx_tracker_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create mx_tracker" do
    test "renders mx_tracker when data is valid", %{conn: conn} do
      conn = post conn, mx_tracker_path(conn, :create), mx_tracker: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, mx_tracker_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "ip" => "some ip",
        "name" => "some name",
        "url" => "some url",
        "key_id" => "some key_id",
        "access_key" => "some access_key"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, mx_tracker_path(conn, :create), mx_tracker: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update mx_tracker" do
    setup [:create_mx_tracker]

    test "renders mx_tracker when data is valid", %{conn: conn, mx_tracker: %MxTracker{id: id} = mx_tracker} do
      conn = put conn, mx_tracker_path(conn, :update, mx_tracker), mx_tracker: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, mx_tracker_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "ip" => "some updated ip",
        "name" => "some updated name",
        "url" => "some updated url",
        "key_id" => "some updated key_id",
        "access_key" => "some updated access_key"}
    end

    test "renders errors when data is invalid", %{conn: conn, mx_tracker: mx_tracker} do
      conn = put conn, mx_tracker_path(conn, :update, mx_tracker), mx_tracker: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete mx_tracker" do
    setup [:create_mx_tracker]

    test "deletes chosen mx_tracker", %{conn: conn, mx_tracker: mx_tracker} do
      conn = delete conn, mx_tracker_path(conn, :delete, mx_tracker)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, mx_tracker_path(conn, :show, mx_tracker)
      end
    end
  end

  defp create_mx_tracker(_) do
    mx_tracker = fixture(:mx_tracker)
    {:ok, mx_tracker: mx_tracker}
  end
end
