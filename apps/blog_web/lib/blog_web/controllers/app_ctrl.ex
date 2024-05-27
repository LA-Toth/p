defmodule BlogWeb.AppCtrl do
  use Phoenix.Controller,
    formats: [:html, :json],
    layouts: [html: BlogWeb.Layouts]

  import Plug.Conn

  def authenticate_user(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to access that page")
      |> redirect(to: BlogWeb.Router.Helpers.page_path(conn, :home))
      |> halt()
    end
  end
end
