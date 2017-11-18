# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :utilshare,
  ecto_repos: [Utilshare.Repo]

# Configures the endpoint
config :utilshare, UtilshareWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "aYesRzULu9NglOOhdG8NOvXL4ZrM+jZzELuKCMQRNxmtV6ypI+hCRADu1p8V6fKl",
  render_errors: [view: UtilshareWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Utilshare.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Utilshare.Accounts.User,
  repo: Utilshare.Repo,
  module: Utilshare,
  web_module: UtilshareWeb,
  router: UtilshareWeb.Router,
  messages_backend: UtilshareWeb.Coherence.Messages,
  logged_out_url: "/",
  opts: [:authenticatable]
# %% End Coherence Configuration %%
