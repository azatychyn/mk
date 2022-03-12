defmodule Mk.Repo.Migrations.CreateImages do
  use Ecto.Migration

  def change do
    create table(:images, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :image_path, :string

      add :product_id, references(:products, type: :binary_id, on_delete: :delete_all)

      timestamps()
    end
  end
end
