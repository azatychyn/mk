defmodule Mk.Images.Image do
  use Ecto.Schema

  import Ecto.Changeset

  alias Mk.Products.Product
  alias Mk.Categories.Category

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "images" do
    field :image_path, :string

    belongs_to :product, Product
    belongs_to :category, Category

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:image_path, :product_id, :category_id])
    |> validate_required([:image_path])
  end
end
