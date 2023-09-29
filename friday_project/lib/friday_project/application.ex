defmodule FridayProject.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      FridayProjectWeb.Telemetry,
      # Start the Ecto repository
      FridayProject.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: FridayProject.PubSub},
      # Start Finch
      {Finch, name: FridayProject.Finch},
      # Start the Endpoint (http/https)
      FridayProjectWeb.Endpoint
      # Start a worker by calling: FridayProject.Worker.start_link(arg)
      # {FridayProject.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FridayProject.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FridayProjectWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
