defmodule PluginApp.RouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts PlugApp.Router.init([])

  test "returns 'Welcome'" do
    # Create a test connection
    conn = conn(:get, "/")

    # Invoke the plug
    conn = PlugApp.Router.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Welcome"
  end

  test "returns 'This is awesome'" do
    # Create a test connection
    conn = conn(:get, "/about")

    # Invoke the plug
    conn = PlugApp.Router.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "This is awesome"
  end
end
