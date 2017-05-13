defmodule MyApp.Router do
  @moduledoc """
  Router for MyApp application
  """
  use Plug.Router
  plug :match
  plug :dispatch

  @doc """
  Start the Router
  """

  def start_link() do
    {:ok, _} = Plug.Adapters.Cowboy.http(MyApp.Router, [], [port: 4001])
  end

  get "/hello" do
    conn
    |> put_resp_content_type("text/html")
    |> send_resp 200, "<h1> Huzzah!!!</h1>"
  end

  forward "/", to: MyApp.HelloPlug

  match _ do
    conn
      |> send_resp(404, "Not Found")
      |> halt
  end
end
