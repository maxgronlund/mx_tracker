defmodule MxTracker.Admin.MxNode do
  use Ecto.Schema
  import Ecto.Changeset
  alias MxTracker.Admin.MxNode


  schema "mx_nodes" do
    field :name, :string
    field :node_type, :string
    field :url, :string
    field :node_uuid, :string

    timestamps()
  end

  @doc false
  def changeset(%MxNode{} = mx_node, attrs) do
    mx_node
    |> cast(attrs, [:name, :url, :node_type, :node_uuid])
    |> validate_required([:name, :url, :node_type, :node_uuid])
  end
end
