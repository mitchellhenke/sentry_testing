# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :supertest,
  ecto_repos: [Supertest.Repo]

# Configures the endpoint
config :supertest, Supertest.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MvJVaC78sNH58teTSJxCr+0gLcb3IUSWiF6TFPNNWuLU3q2aZsnpqJ/UNGwOSWLt",
  render_errors: [view: Supertest.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Supertest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :sentry,
  dsn: "",
  enable_source_code_context: true,
  use_error_logger:           true,
  root_source_code_path:      File.cwd!,
  tags:                       %{env: "production"},
  environment_name:           Mix.env(),
  included_environments:      [:prod]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
