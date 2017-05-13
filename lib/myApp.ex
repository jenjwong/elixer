defmodule MyApp do
  use Application
  @doc """
  Start function for MyApp application
  """
  def start(_types, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(MyApp.Router, [])
    ]

    opts = [
      stategy: :one_for_one, name: MyApp.Supervisor
    ]

    Supervisor.start_link(children, opts)
  end
end
