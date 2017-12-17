defmodule MxTrackerWeb.MxTrackerView do
  use MxTrackerWeb, :view
  alias MxTrackerWeb.MxTrackerView

  def render("index.json", %{mx_trackers: mx_trackers}) do
    %{data: render_many(mx_trackers, MxTrackerView, "mx_tracker.json")}
  end

  def render("show.json", %{mx_tracker: mx_tracker}) do
    %{data: render_one(mx_tracker, MxTrackerView, "mx_tracker.json")}
  end

  def render("mx_tracker.json", %{mx_tracker: mx_tracker}) do
    %{id: mx_tracker.id,
      name: mx_tracker.name,
      url: mx_tracker.url,
      ip: mx_tracker.ip,
      key_id: mx_tracker.key_id,
      access_key: mx_tracker.access_key}
  end
end
