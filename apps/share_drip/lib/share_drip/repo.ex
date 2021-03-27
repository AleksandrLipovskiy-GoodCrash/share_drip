defmodule ShareDrip.Repo do
  use Ecto.Repo,
    otp_app: :share_drip,
    adapter: Ecto.Adapters.Postgres
end
