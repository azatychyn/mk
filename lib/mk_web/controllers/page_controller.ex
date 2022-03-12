defmodule MkWeb.PageController do
  use MkWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
