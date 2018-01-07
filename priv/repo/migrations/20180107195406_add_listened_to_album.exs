defmodule Musicapi.Repo.Migrations.AddListenedToAlbum do
  use Ecto.Migration

  def change do
    alter table(:albums) do
      add :listened, :boolean, null: false, default: false
    end
  end
end
