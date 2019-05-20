defmodule AdesWeb.Router do
  use AdesWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AdesWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/posts", PostController, :index
    get "/posts/:id/edit", PostController, :edit
    get "/posts/new", PostController, :new
    get "/posts/:id", PostController, :show
    post "/posts", PostController, :create
    patch "/posts/:id", PostController, :update
    delete "/posts/:id", PostController, :delete
    get "/users", UserController, :index
    get "/users/:id/edit", UserController, :edit
    get "/users/new", UserController, :new
    get "/users/:id", UserController, :show
    post "/users", UserController, :create
    post "/users", UserController, :delete

  end

  # Other scopes may use custom stacks.
  #scope "/api", AdesWeb do
  #pipe_through :api
  # end
end
