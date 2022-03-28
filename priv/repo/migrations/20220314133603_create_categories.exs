defmodule Mk.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :description, {:array, :text}
      add :label, :string
      add :name, :string
      add :peculiarity, {:array, :text}

      timestamps()
    end
  end
end
