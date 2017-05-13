defmodule MyApp.Router do
  @moduledoc """
  Router for MyApp application
  """
  use Plug.Router
  plug :match
  plug :dispatch

  forward "/", to: MyApp.HelloPlug
  @doc """
  Start the Router
  """

  def start_link() do
    {:ok, _} = Plug.Adapters.Cowboy.http(MyApp.Router, [], [port: 4001])
  end
  match _ do
    conn
      |> send_resp(404, "Not Found")
      |> halt
  end
end
