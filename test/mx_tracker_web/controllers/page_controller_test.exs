defmodule MxTrackerWeb.PageControllerTest do
  use MxTrackerWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Mx Tracker 01"
  end
end
