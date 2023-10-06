defmodule FridayProject.WeekEnds.Patry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "parties" do
    field(:name, :string)
    field(:date_party, :naive_datetime)
    belongs_to(:first_dev_experience, FridayProject.Fridays.FirstDevExperience)

    timestamps()
  end

  @doc false
  def changeset(party, attrs) do
    party
    |> cast(attrs, [:date_party, :name, :first_dev_experience_id])
    |> foreign_key_constraint(:first_dev_experience_id)
    |> validate_required([:date_party, :name])
  end
end
