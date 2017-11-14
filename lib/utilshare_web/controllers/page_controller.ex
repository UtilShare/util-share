defmodule UtilshareWeb.PageController do
  use UtilshareWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
