defmodule Mk.Images do
  @moduledoc """
  The Images context.
  """

  import Ecto.Query, warn: false
  alias Mk.Repo

  alias Mk.Images.Image

  @doc """
  Returns the list of images.

  ## Examples

      iex> list_images()
      [%Image{}, ...]

  """
  def list_images do
    Repo.all(Image)
  end

  # def dos() do
  #   a = "/Users/ter/projects/mk/priv/static/images/projects"
  #   a
  #   |> File.ls!()
  #   |> Enum.filter(fn f -> f != ".DS_Store" end)
  #   |> Enum.map(fn f ->
  #     {:ok, array} = File.ls(Path.join(a, f)) |> IO.inspect()

  #     {:ok, product} = Mk.Products.create_product(%{name: "name" <> f})

  #     array
  #     |> Enum.filter(fn f -> Regex.match?(~r/(.\.jpg|.\.jpeg)/, f) end)
  #     |> Enum.map( fn filename ->
  #       path =
  #       "/images/projects"
  #       |> Path.join(f)
  #       |> Path.join(filename)
  #       Mk.Images.create_image(%{image_path: path, product_id: product.id})
  #     end)
  #   end)
  # end

  @doc """
  Gets a single image.

  Raises `Ecto.NoResultsError` if the Image does not exist.

  ## Examples

      iex> get_image!(123)
      %Image{}

      iex> get_image!(456)
      ** (Ecto.NoResultsError)

  """
  def get_image!(id), do: Repo.get!(Image, id)

  @doc """
  Creates a image.

  ## Examples

      iex> create_image(%{field: value})
      {:ok, %Image{}}

      iex> create_image(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_image(attrs \\ %{}) do
    %Image{}
    |> Image.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a image.

  ## Examples

      iex> update_image(image, %{field: new_value})
      {:ok, %Image{}}

      iex> update_image(image, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_image(%Image{} = image, attrs) do
    image
    |> Image.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a image.

  ## Examples

      iex> delete_image(image)
      {:ok, %Image{}}

      iex> delete_image(image)
      {:error, %Ecto.Changeset{}}

  """
  def delete_image(%Image{} = image) do
    Repo.delete(image)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking image changes.

  ## Examples

      iex> change_image(image)
      %Ecto.Changeset{data: %Image{}}

  """
  def change_image(%Image{} = image, attrs \\ %{}) do
    Image.changeset(image, attrs)
  end
end
