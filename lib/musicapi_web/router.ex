defmodule MusicapiWeb.Router do
  use MusicapiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphql", Absinthe.Plug,
      schema: MusicapiWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: MusicapiWeb.Schema,
      interface: :simple,
      context: %{pubsub: MusicapiWeb.Endpoint}
  end
end
