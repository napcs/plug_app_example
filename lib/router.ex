defmodule PlugApp.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "Welcome")
  end

  get "/about" do
    send_resp(conn, 200, "This is awesome")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
