# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

config :share_drip_web,
  ecto_repos: [ShareDripWeb.Repo],
  generators: [context_app: false]

# Configures the endpoint
config :share_drip_web, ShareDripWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "B/6XpffPeDcKu4zq5KUs4d6pBrwH+sva3T7XioXfr7bCzNAakC6efvI0rUhADvNq",
  render_errors: [view: ShareDripWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ShareDripWeb.PubSub,
  live_view: [signing_salt: "dW5m4vzS"]

# Configure Mix tasks and generators
config :share_drip,
  ecto_repos: [ShareDrip.Repo]

# Configure provide for file storage
config :share_drip,
  storage_provider: ShareDrip.Storage.Providers.GoogleCloudStorage.Local

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
