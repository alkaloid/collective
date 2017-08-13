defmodule CollectiveWeb.PageController do
  use CollectiveWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
