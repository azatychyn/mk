defmodule Mk.FeedbackFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Mk.Feedback` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        email: "some email",
        message: "some message",
        name: "some name",
        number: "some number"
      })
      |> Mk.Feedback.create_message()

    message
  end
end
