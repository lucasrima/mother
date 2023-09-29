defmodule FridayProject.Fridays.FirstDevExperience do
  use Ecto.Schema
  import Ecto.Changeset

  schema "first_dev_experiences" do
    field :name, :string
    field :description, :string
    field :nb_thing, :integer

    timestamps()
  end

  @doc false
  def changeset(first_dev_experience, attrs) do
    first_dev_experience
    |> cast(attrs, [:name, :description, :nb_thing])
    |> validate_required([:name, :description, :nb_thing])
  end
end
