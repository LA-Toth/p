defmodule BlogWeb.UserHTML do
  use BlogWeb, :html

  alias Blog.Accounts

  def first_name(%Accounts.User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end

  embed_templates "user_html/*"
end
