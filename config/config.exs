# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :my_shop_api, MyShopApi.Repo,
  database: "my_shop_api_repo",
  username: "postgres",
  password: "gustav7393",
  hostname: "localhost"

config :my_shop_api,
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :my_shop_api, MyShopApiWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Phoenix.Endpoint.Cowboy2Adapter,
  render_errors: [
    formats: [json: MyShopApiWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: MyShopApi.PubSub,
  live_view: [signing_salt: "uDjbS4cC"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :my_shop_api,
      ecto_repos: [MyShopApi.Repo]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
