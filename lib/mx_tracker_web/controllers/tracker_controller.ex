defmodule MxTrackerWeb.TrackerController do
  use MxTrackerWeb, :controller

  alias MxTracker.Trackers
  alias MxTracker.Trackers.MxTracker

  def index(conn, _params) do
    mx_trackers = Trackers.list_mx_trackers()
    render(conn, "index.html", mx_trackers: mx_trackers)
  end

  def new(conn, _params) do
    changeset = Trackers.change_mx_tracker(%MxTracker{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"mx_tracker" => tracker_params}) do
    case Trackers.create_mx_tracker(tracker_params) do
      {:ok, tracker} ->
        conn
        |> put_flash(:info, "Tracker created successfully.")
        |> redirect(to: tracker_path(conn, :show, tracker))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    mx_tracker = Trackers.get_mx_tracker!(id)
    render(conn, "show.html", mx_tracker: mx_tracker)
  end

  def edit(conn, %{"id" => id}) do
   mx_tracker = Trackers.get_mx_tracker!(id)
    changeset = Trackers.change_mx_tracker(mx_tracker)
    render(conn, "edit.html", mx_tracker: mx_tracker, changeset: changeset)
  end

  def update(conn, %{"id" => id, "mx_tracker" => mx_tracker_params}) do
    mx_tracker = Trackers.get_mx_tracker!(id)

    case Trackers.update_mx_tracker(mx_tracker, mx_tracker_params) do
      {:ok, mx_node} ->
        conn
        |> put_flash(:info, "Tracker updated successfully.")
        |> redirect(to: tracker_path(conn, :show, mx_tracker))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", mx_tracker: mx_tracker, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    mx_tracker = Trackers.get_mx_tracker!(id)
    {:ok, _mx_node} = Trackers.delete_mx_tracker(mx_tracker)

    conn
    |> put_flash(:info, "Mx tracker deleted successfully.")
    |> redirect(to: tracker_path(conn, :index))
  end
end
