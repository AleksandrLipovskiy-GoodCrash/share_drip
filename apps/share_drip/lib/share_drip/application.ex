defmodule ShareDrip.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ShareDrip.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ShareDrip.PubSub}
      # Start a worker by calling: ShareDrip.Worker.start_link(arg)
      # {ShareDrip.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: ShareDrip.Supervisor)
  end
end
