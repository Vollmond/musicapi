defmodule MusicapiWeb.RecordsResolver do
  alias Musicapi.Records

  def all_albums(_root, _args, _info) do
    albums = Records.list_albums()
    {:ok, albums}
  end
end
