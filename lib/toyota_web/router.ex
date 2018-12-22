defmodule ToyotaWeb.Router do
  use ToyotaWeb, :router


  pipeline :graphql do
    plug CORSPlug, origin: "*"
    plug ToyotaWeb.Context
  end

  scope "/api" do
    pipe_through :graphql

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: ToyotaWeb.Schema

    forward "/", Absinthe.Plug,
      schema: ToyotaWeb.Schema

  end
  
end
