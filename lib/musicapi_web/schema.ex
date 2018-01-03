defmodule MusicapiWeb.Schema do
  use Absinthe.Schema

  alias Musicapi.Records

  object :album do
    field :id, non_null(:id)
    field :name, non_null(:string)
  end

  query do
    field :all_albums, non_null(list_of(non_null(:album))) do
      resolve &MusicapiWeb.RecordsResolver.all_albums/3
    end
  end
end
