defmodule FridayProject.WeekEnds.Patry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "parties" do
    field :name, :string
    field :date_party, :naive_datetime
    field :first_dev_experience_id, :id

    timestamps()
  end

  @doc false
  def changeset(patry, attrs) do
    patry
    |> cast(attrs, [:date_party, :name])
    |> validate_required([:date_party, :name])
  end
end
