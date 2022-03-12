use Mix.Config

port = String.to_integer(System.get_env("PORT") || "4000")
default_secret_key_base = "gJrpViAP9EdK4dgIJGKyVX/0EqwOJjlfxR7IipILdvzm8MwcUxnG9G4BIkZZceP9"

config :mk, MkWeb.Endpoint,
  http: [port: port],
  url: [host: "localhost", port: port],
  secret_key_base: System.get_env("SECRET_KEY_BASE") || default_secret_key_base
