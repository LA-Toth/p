defmodule BlogWeb.Helpers.HtmlHelpers do
  def icon_text(icon, text) do
    icon_class = "fa fa-#{icon}"
    html = "<i class=\"#{icon_class}\" aria-hidden=\"true\"></i>#{text}"
    html
  end
end
