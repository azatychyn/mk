defmodule Mk.ImagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Mk.Images` context.
  """

  @doc """
  Generate a image.
  """
  def image_fixture(attrs \\ %{}) do
    {:ok, image} =
      attrs
      |> Enum.into(%{
        image_path: "some image_path",
        product_id: "some product_id"
      })
      |> Mk.Images.create_image()

    image
  end
end
