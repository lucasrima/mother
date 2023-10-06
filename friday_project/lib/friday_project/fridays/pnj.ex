defmodule FridayProject.Fridays.Pnj do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pnjs" do
    field :name, :string
    field :description, :string
    field :nb_thing, :integer

    timestamps()
  end

  @doc false
  def changeset(pnj, attrs) do
    pnj
    |> cast(attrs, [:name, :description, :nb_thing])
    |> validate_required([:name, :description, :nb_thing])
  end
end
