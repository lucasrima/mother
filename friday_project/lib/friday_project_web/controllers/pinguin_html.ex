defmodule FridayProjectWeb.PinguinHTML do
  use FridayProjectWeb, :html

  embed_templates "pinguin_html/*"

  @doc """
  Renders a pinguin form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def pinguin_form(assigns)
end
