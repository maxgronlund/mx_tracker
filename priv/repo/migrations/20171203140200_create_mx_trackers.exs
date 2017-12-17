defmodule MxTracker.Repo.Migrations.CreateMxTrackers do
  use Ecto.Migration

  def change do
    create table(:mx_trackers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :url, :string
      add :ip, :string
      add :key_id, :string
      add :access_key, :string

      timestamps()
    end

  end
end
