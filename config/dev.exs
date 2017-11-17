use Mix.Config

config :utilshare, UtilshareWeb.Endpoint,
  http: [
    port: 4000,
    protocol_options: [max_header_value_length: 8192]
  ],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
                    cd: Path.expand("../assets", __DIR__)]]

config :utilshare, UtilshareWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{lib/utilshare_web/views/.*(ex)$},
      ~r{lib/utilshare_web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :utilshare, Utilshare.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "utilshare",
  password: "je9ho1eeSu",
  database: "utilshare_dev",
  hostname: "localhost",
  pool_size: 10

import_config "config.secret.exs"
