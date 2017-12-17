defmodule MxTrackerWeb.MxTrackerController do
  use MxTrackerWeb, :controller

  alias MxTracker.Trackers
  alias MxTracker.Trackers.MxTracker

  action_fallback MxTrackerWeb.FallbackController

  def index(conn, _params) do
    mx_trackers = Trackers.list_mx_trackers()
    render(conn, "index.json", mx_trackers: mx_trackers)
  end

  def create(conn, %{"mx_tracker" => mx_tracker_params}) do
    with {:ok, %MxTracker{} = mx_tracker} <- Trackers.create_mx_tracker(mx_tracker_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", mx_tracker_path(conn, :show, mx_tracker))
      |> render("show.json", mx_tracker: mx_tracker)
    end
  end

  def show(conn, %{"id" => id}) do
    mx_tracker = Trackers.get_mx_tracker!(id)
    render(conn, "show.json", mx_tracker: mx_tracker)
  end

  def update(conn, %{"id" => id, "mx_tracker" => mx_tracker_params}) do
    mx_tracker = Trackers.get_mx_tracker!(id)

    with {:ok, %MxTracker{} = mx_tracker} <- Trackers.update_mx_tracker(mx_tracker, mx_tracker_params) do
      render(conn, "show.json", mx_tracker: mx_tracker)
    end
  end

  def delete(conn, %{"id" => id}) do
    mx_tracker = Trackers.get_mx_tracker!(id)
    with {:ok, %MxTracker{}} <- Trackers.delete_mx_tracker(mx_tracker) do
      send_resp(conn, :no_content, "")
    end
  end
end
