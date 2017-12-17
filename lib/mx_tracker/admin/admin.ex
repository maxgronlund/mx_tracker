defmodule MxTracker.Admin do
  @moduledoc """
  The Admin context.
  """

  import Ecto.Query, warn: false
  alias MxTracker.Repo

  alias MxTracker.Admin.MxNode

  @doc """
  Returns the list of mx_nodes.

  ## Examples

      iex> list_mx_nodes()
      [%MxNode{}, ...]

  """
  def list_mx_nodes do
    Repo.all(MxNode)
  end

  @doc """
  Gets a single mx_node.

  Raises `Ecto.NoResultsError` if the Mx node does not exist.

  ## Examples

      iex> get_mx_node!(123)
      %MxNode{}

      iex> get_mx_node!(456)
      ** (Ecto.NoResultsError)

  """
  def get_mx_node!(id), do: Repo.get!(MxNode, id)

  @doc """
  Creates a mx_node.

  ## Examples

      iex> create_mx_node(%{field: value})
      {:ok, %MxNode{}}

      iex> create_mx_node(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_mx_node(attrs \\ %{}) do
    %MxNode{}
    |> MxNode.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a mx_node.

  ## Examples

      iex> update_mx_node(mx_node, %{field: new_value})
      {:ok, %MxNode{}}

      iex> update_mx_node(mx_node, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_mx_node(%MxNode{} = mx_node, attrs) do
    mx_node
    |> MxNode.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a MxNode.

  ## Examples

      iex> delete_mx_node(mx_node)
      {:ok, %MxNode{}}

      iex> delete_mx_node(mx_node)
      {:error, %Ecto.Changeset{}}

  """
  def delete_mx_node(%MxNode{} = mx_node) do
    Repo.delete(mx_node)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking mx_node changes.

  ## Examples

      iex> change_mx_node(mx_node)
      %Ecto.Changeset{source: %MxNode{}}

  """
  def change_mx_node(%MxNode{} = mx_node) do
    MxNode.changeset(mx_node, %{})
  end
end
