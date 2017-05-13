defmodule MyApp do
  use Application
  @doc """
  Start function for MyApp application
  """
  def start(_types, _args) do
    import Supervisor.Spec, warn: false
  end
end
