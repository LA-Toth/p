defmodule BlogWeb.SessionController do
  use BlogWeb, :controller

  def new(conn, _) do
    render(conn, :new)
  end

  def create(
        conn,
        %{"session" => %{"username" => username, "password" => pass}}
      ) do
    case Blog.Accounts.authenticate_by_username_and_pass(username, pass) do
      {:ok, user} ->
        conn
        |> BlogWeb.Auth.login(user)
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: page_path(conn, :home))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Invalid username/password combination")
        |> render(:new)
    end
  end

  def delete(conn, _) do
    conn
    |> BlogWeb.Auth.logout()
    |> redirect(to: page_path(conn, :home))
  end
end
