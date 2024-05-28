defmodule BlogWeb.PostHTML do
  use BlogWeb, :html

  embed_templates "post_html/*"

  @doc """
  Renders a post form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def post_form(assigns)

  def category_select_options(categories) do
    for category <- categories, do: {category.name, category.id}
  end

  def category_select_simple_options(categories) do
    categories
    |> Enum.reduce(%{}, fn category, acc ->
      Map.put(acc, category.name, category.id)
    end)
  end
end
