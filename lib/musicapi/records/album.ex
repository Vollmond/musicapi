defmodule Musicapi.Records.Album do
  use Ecto.Schema
  import Ecto.Changeset
  alias Musicapi.Records.Album


  schema "albums" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Album{} = album, attrs) do
    album
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
