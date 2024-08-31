import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :my_shop_api, MyShopApiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "PnzDINEJ+gb7U1tkW558UcrBs4s7SLTDtfjqXZGu06h5HKNMWLmIu9JgU0Z6NATW",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
