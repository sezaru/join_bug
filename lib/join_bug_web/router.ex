defmodule JoinBugWeb.Router do
  use JoinBugWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", JoinBugWeb do
    pipe_through :api
  end
end
