defmodule MxTrackerWeb.MxNodeController do
  use MxTrackerWeb, :controller

  alias MxTracker.Admin
  alias MxTracker.Admin.MxNode

  def index(conn, _params) do
    mx_nodes = Admin.list_mx_nodes()
    render(conn, "index.html", mx_nodes: mx_nodes)
  end

  def new(conn, _params) do
    changeset = Admin.change_mx_node(%MxNode{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"mx_node" => mx_node_params}) do
    case Admin.create_mx_node(mx_node_params) do
      {:ok, mx_node} ->
        conn
        |> put_flash(:info, "Mx node created successfully.")
        |> redirect(to: mx_node_path(conn, :show, mx_node))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    mx_node = Admin.get_mx_node!(id)
    render(conn, "show.html", mx_node: mx_node)
  end

  def edit(conn, %{"id" => id}) do
    mx_node = Admin.get_mx_node!(id)
    changeset = Admin.change_mx_node(mx_node)
    render(conn, "edit.html", mx_node: mx_node, changeset: changeset)
  end

  def update(conn, %{"id" => id, "mx_node" => mx_node_params}) do
    mx_node = Admin.get_mx_node!(id)

    case Admin.update_mx_node(mx_node, mx_node_params) do
      {:ok, mx_node} ->
        conn
        |> put_flash(:info, "Mx node updated successfully.")
        |> redirect(to: mx_node_path(conn, :show, mx_node))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", mx_node: mx_node, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    mx_node = Admin.get_mx_node!(id)
    {:ok, _mx_node} = Admin.delete_mx_node(mx_node)

    conn
    |> put_flash(:info, "Mx node deleted successfully.")
    |> redirect(to: mx_node_path(conn, :index))
  end
end
