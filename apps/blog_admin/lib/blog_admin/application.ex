defmodule BlogAdmin.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BlogAdmin.Telemetry,
      # Start a worker by calling: BlogAdmin.Worker.start_link(arg)
      # {BlogAdmin.Worker, arg},
      # Start to serve requests, typically the last entry
      BlogAdmin.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BlogAdmin.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BlogAdmin.Endpoint.config_change(changed, removed)
    :ok
  end
end
