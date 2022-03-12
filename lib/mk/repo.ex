defmodule Mk.Repo do
  use Ecto.Repo,
    otp_app: :mk,
    adapter: Ecto.Adapters.Postgres
end
