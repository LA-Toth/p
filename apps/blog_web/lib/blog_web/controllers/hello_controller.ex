defmodule BlogWeb.HelloController do
  use BlogWeb, :controller

  def hello(conn, _params) do
    render(conn, :hello)
  end
end
