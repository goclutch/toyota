defmodule ToyotaWeb.Router do
  use ToyotaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ToyotaWeb do
    pipe_through :api
  end
end
