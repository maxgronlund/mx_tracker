defmodule MxTracker.Trackers.MxTracker do
  use Ecto.Schema
  import Ecto.Changeset
  alias MxTracker.Trackers.MxTracker
  @primary_key {:id, :binary_id, autogenerate: true}

  schema "mx_trackers" do
    field :ip, :string
    field :name, :string
    field :url, :string
    field :key_id, :string
    field :access_key, :string

    timestamps()
  end

  @doc false
  def changeset(%MxTracker{} = mx_tracker, attrs) do
    mx_tracker
    |> cast(attrs, [:name, :url, :ip, :key_id, :access_key])
    |> validate_required([:name, :url, :ip, :key_id, :access_key])
  end
end
