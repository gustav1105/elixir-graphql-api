defmodule MyShopApiWeb.Router do
  use MyShopApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  if Mix.env() == :dev do
    scope "/" do
      pipe_through :api

      forward "/graphql", Absinthe.Plug,
        schema: MyShopApiWeb.Schema
      
      forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: MyShopApiWeb.Schema,
      interface: :playground
      end 
    end
end
