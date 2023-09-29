defmodule FridayProject.Repo.Migrations.CreateFirstDevExperiences do
  use Ecto.Migration

  def change do
    create table(:first_dev_experiences) do
      add :name, :string
      add :description, :string
      add :nb_thing, :integer

      timestamps()
    end
  end
end
