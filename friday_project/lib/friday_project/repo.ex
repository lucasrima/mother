defmodule FridayProject.Repo do
  use Ecto.Repo,
    otp_app: :friday_project,
    adapter: Ecto.Adapters.Postgres
end
