defmodule ToyotaWeb.Router do
  use ToyotaWeb, :router

  alias Toyota.Guardian

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do
    plug Guardian.AuthPipeline
  end

  scope "/api/v1", ToyotaWeb do
    pipe_through :api

    post "/sign_up", UserController, :create
    post "/sign_in", UserController, :sign_in
  end

  scope "/api/v1", ToyotaWeb do
    pipe_through :jwt_authenticated

    get "/my_user", UserController, :show
    resources "/profiles", ProfileController, only: [:create, :show]

  end
end
