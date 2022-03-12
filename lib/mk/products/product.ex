defmodule Mk.Products.Product do
  use Ecto.Schema

  import Ecto.Changeset

  alias Mk.Images.Image

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "products" do
    field :name, :string

    has_many :images, Image, on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
