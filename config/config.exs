# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :collective,
  ecto_repos: [Collective.Repo]

# Configures the endpoint
config :collective, CollectiveWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QNjmt9O889AbhLJfQIQoBMFDT/EcADxuJAkP7WqYzkU4iKT1OWuciYqPFyFg267E",
  render_errors: [view: CollectiveWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Collective.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :formex,
  repo: Collective.Repo,
  validator: Formex.Validator.Vex,
  translate_error: &CollectiveWeb.ErrorHelpers.translate_error/1, # optional, from /web/views/error_helpers.ex
  template: Formex.Template.BootstrapHorizontal,        # optional, can be overridden in a template
  template_options: [                                   # optional, can be overridden in a template
    left_column: "col-sm-2",
    right_column: "col-sm-10"
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
