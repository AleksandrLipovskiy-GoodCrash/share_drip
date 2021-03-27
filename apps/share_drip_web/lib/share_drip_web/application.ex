defmodule ShareDripWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ShareDripWeb.Telemetry,
      # Start the Endpoint (http/https)
      ShareDripWeb.Endpoint,
      {Phoenix.PubSub, name: ShareDripWeb.PubSub}
      # Start a worker by calling: ShareDripWeb.Worker.start_link(arg)
      # {ShareDripWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ShareDripWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ShareDripWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end