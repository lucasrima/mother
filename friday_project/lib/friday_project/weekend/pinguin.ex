defmodule FridayProject.Weekend.Pinguin do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pinguins" do
    field :name, :string
    field :age, :integer

    timestamps()
  end

  @doc false
  def changeset(pinguin, attrs) do
    pinguin
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
  end
end
