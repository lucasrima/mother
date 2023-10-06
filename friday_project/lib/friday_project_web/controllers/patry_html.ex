defmodule FridayProjectWeb.PatryHTML do
  use FridayProjectWeb, :html

  embed_templates "patry_html/*"

  @doc """
  Renders a patry form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def patry_form(assigns)
end
