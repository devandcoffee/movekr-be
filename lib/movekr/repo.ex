defmodule Movekr.Repo do
  use Ecto.Repo,
    otp_app: :movekr,
    adapter: Ecto.Adapters.Postgres
end
