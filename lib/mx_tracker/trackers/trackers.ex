defmodule MxTracker.Trackers do
  @moduledoc """
  The Trackers context.
  """

  import Ecto.Query, warn: false
  alias MxTracker.Repo

  alias MxTracker.Trackers.MxTracker

  @doc """
  Returns the list of mx_trackers.

  ## Examples

      iex> list_mx_trackers()
      [%MxTracker{}, ...]

  """
  def list_mx_trackers do
    Repo.all(MxTracker)
  end

  @doc """
  Gets a single mx_tracker.

  Raises `Ecto.NoResultsError` if the Mx tracker does not exist.

  ## Examples

      iex> get_mx_tracker!(123)
      %MxTracker{}

      iex> get_mx_tracker!(456)
      ** (Ecto.NoResultsError)

  """
  def get_mx_tracker!(id), do: Repo.get!(MxTracker, id)

  @doc """
  Creates a mx_tracker.

  ## Examples

      iex> create_mx_tracker(%{field: value})
      {:ok, %MxTracker{}}

      iex> create_mx_tracker(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_mx_tracker(attrs \\ %{}) do
    %MxTracker{}
    |> MxTracker.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a mx_tracker.

  ## Examples

      iex> update_mx_tracker(mx_tracker, %{field: new_value})
      {:ok, %MxTracker{}}

      iex> update_mx_tracker(mx_tracker, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_mx_tracker(%MxTracker{} = mx_tracker, attrs) do
    mx_tracker
    |> MxTracker.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a MxTracker.

  ## Examples

      iex> delete_mx_tracker(mx_tracker)
      {:ok, %MxTracker{}}

      iex> delete_mx_tracker(mx_tracker)
      {:error, %Ecto.Changeset{}}

  """
  def delete_mx_tracker(%MxTracker{} = mx_tracker) do
    Repo.delete(mx_tracker)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking mx_tracker changes.

  ## Examples

      iex> change_mx_tracker(mx_tracker)
      %Ecto.Changeset{source: %MxTracker{}}

  """
  def change_mx_tracker(%MxTracker{} = mx_tracker) do
    MxTracker.changeset(mx_tracker, %{})
  end
end
