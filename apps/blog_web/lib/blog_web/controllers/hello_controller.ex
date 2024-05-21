defmodule BlogWeb.HelloController do
  use BlogWeb, :controller


  def index(conn, _params) do
    hello(conn, %{"name"=> "the BLOG"})

  end
  def hello(conn, %{"name" => name }) do
    render(conn, :hello, name: name)
  end
end
