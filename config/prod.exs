import Config

# For production, don't forget to configure the url host
# to something meaningful, Phoenix uses this information
# when generating URLs.
#
# Note we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the `mix phx.digest` task,
# which you should run after static files are built and
# before starting your production server.
config :mk, MkWeb.Endpoint,
  # url: [host: "example.com", port: 80],
  # url: [host: System.get_env("RENDER_EXTERNAL_HOSTNAME") || "localhost", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json",
  # critical for Phoenix to run
  server: true,
  root: ".",
  version: Application.spec(:mk, :vsn),
  check_origin: false

# Do not print debug messages in production
config :logger, level: :info
