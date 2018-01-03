defmodule MusicapiWeb.Router do
  use MusicapiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MusicapiWeb do
    pipe_through :api
  end
end
