defmodule PlugApp do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # the run function in this module.
      worker(__MODULE__, [], function: :run)
    ]

    opts = [strategy: :one_for_one, name: PlugApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # bind our router to Cowboy.
  # run has to return {:ok, and something} to successfully start.
  def run do
    Plug.Adapters.Cowboy.http PlugApp.Router, []
  end
end
