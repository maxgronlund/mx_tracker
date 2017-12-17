defmodule MxTracker.Repo.Migrations.CreateMxNodes do
  use Ecto.Migration

  def change do
    create table(:mx_nodes) do
      add :name, :string
      add :url, :string
      add :node_type, :string
      add :node_uuid, :string

      timestamps()
    end

  end
end
