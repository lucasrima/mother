defmodule FridayProject.Repo.Migrations.CreateParties do
  use Ecto.Migration

  def change do
    create table(:parties) do
      add :date_party, :naive_datetime
      add :name, :string
      add :first_dev_experience_id, references(:first_dev_experiences, on_delete: :nothing)

      timestamps()
    end

    create index(:parties, [:first_dev_experience_id])
  end
end
