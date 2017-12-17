defmodule MxTrackerWeb.Router do
  use MxTrackerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MxTrackerWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/mx_nodes", MxNodeController
    resources "/trackers", TrackerController
  end

  scope "/api", MxTrackerWeb do
    pipe_through :api
    resources "/mx_trackers", MxTrackerController, except: [:new, :edit]
  end
end
