defmodule MusicapiWeb.Schema do
  use Absinthe.Schema

  alias Musicapi.Records

  object :album do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :listened, non_null(:boolean)
  end

  query do
    field :all_albums, non_null(list_of(non_null(:album))) do
      arg :listened, :boolean
      resolve &MusicapiWeb.RecordsResolver.all_albums/3
    end
  end

  mutation do
    field :create_album, :album do
      arg :name, non_null(:string)

      resolve &MusicapiWeb.RecordsResolver.create_album/3
    end
  end
end
