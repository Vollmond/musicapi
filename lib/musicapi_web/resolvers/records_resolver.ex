defmodule MusicapiWeb.RecordsResolver do
  alias Musicapi.Records

  def all_albums(_root, _args, _info) do
    albums = Records.list_albums()
    {:ok, albums}
  end

  def create_album(_root, args, _info) do
    case Records.create_album(args) do
      {:ok, album} -> {:ok, album}
      _error ->
        {:error, "could not create link"}
    end
  end
end
