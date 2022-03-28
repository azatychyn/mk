defmodule Mk.Categories.Category do
  use Ecto.Schema

  import Ecto.Changeset

  alias Mk.Images.Image

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "categories" do
    field :description, {:array, :string}
    field :name, :string
    field :label, :string
    field :peculiarity, {:array, :string}

    has_one :image, Image, on_delete: :delete_all
    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:description, :name, :label, :peculiarity])
    |> validate_required([:description, :name, :label, :peculiarity])
    |> maybe_put_assoc_image(attrs[:image])
  end

  defp maybe_put_assoc_image(changeset, nil), do: changeset
  defp maybe_put_assoc_image(changeset, _image), do: cast_assoc(changeset, :image, with: &Image.changeset/2)
end
