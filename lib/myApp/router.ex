defmodule MyApp.Router do
  @moduledoc """
  Router for MyApp application
  """
  use Plug.Router

  def start_link() do
    {:ok, _} = Plug.Adapters.Cowboy.http(MyApp.Router, [], [port: 4000])
  end
  match _ do
    conn
      |> send_resp(404, "Not Found")
      |> halt
  end
end
