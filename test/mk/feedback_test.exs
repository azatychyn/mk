defmodule Mk.FeedbackTest do
  use Mk.DataCase

  alias Mk.Feedback

  describe "messages" do
    alias Mk.Feedback.Message

    import Mk.FeedbackFixtures

    @invalid_attrs %{email: nil, message: nil, name: nil, number: nil}

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Feedback.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Feedback.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      valid_attrs = %{
        email: "some email",
        message: "some message",
        name: "some name",
        number: "some number"
      }

      assert {:ok, %Message{} = message} = Feedback.create_message(valid_attrs)
      assert message.email == "some email"
      assert message.message == "some message"
      assert message.name == "some name"
      assert message.number == "some number"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Feedback.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()

      update_attrs = %{
        email: "some updated email",
        message: "some updated message",
        name: "some updated name",
        number: "some updated number"
      }

      assert {:ok, %Message{} = message} = Feedback.update_message(message, update_attrs)
      assert message.email == "some updated email"
      assert message.message == "some updated message"
      assert message.name == "some updated name"
      assert message.number == "some updated number"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Feedback.update_message(message, @invalid_attrs)
      assert message == Feedback.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Feedback.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Feedback.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Feedback.change_message(message)
    end
  end
end
