defmodule Mk.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :message, :text
      add :name, :string
      add :number, :string
      add :email, :string
      add :agree, :boolean

      timestamps()
    end
  end
end
