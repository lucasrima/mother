defmodule FridayProject.Repo.Migrations.CreatePnjs do
  use Ecto.Migration

  def change do
    create table(:pnjs) do
      add :name, :string
      add :description, :string
      add :nb_thing, :integer

      timestamps()
    end
  end
end
