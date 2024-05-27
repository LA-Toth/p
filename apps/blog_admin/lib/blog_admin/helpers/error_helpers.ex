defmodule BlogAdmin.Helpers.ErrorHelpers do
  @moduledoc """
  Conveniences for translating and building error messages.
  """

  # TODO: use Phoenix.Component instead
  use PhoenixHTMLHelpers

  import BlogAdmin.CoreComponents

  @doc """
  Generates tag for inlined form input errors.
  """
  def error_tag(form, field) do
    Enum.map(Keyword.get_values(form.errors, field), fn error ->
      content_tag(:span, translate_error(error), class: "help-block")
    end)
  end
end
