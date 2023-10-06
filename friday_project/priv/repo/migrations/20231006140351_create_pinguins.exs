defmodule FridayProject.Repo.Migrations.CreatePinguins do
  use Ecto.Migration

  def change do
    create table(:pinguins) do
      add :name, :string
      add :age, :integer

      timestamps()
    end
  end
end
