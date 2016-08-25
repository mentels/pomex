defmodule Pomex.PageController do
  use Pomex.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
