defmodule OnDeckWeb.PageController do
  use OnDeckWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
