defmodule MkWeb.MessageLive.Index do
  use MkWeb, :live_view

  alias Mk.Feedback
  alias Mk.Feedback.Message

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :messages, list_messages())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Редактировать Сообщение")
    |> assign(:message, Feedback.get_message!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "Новое Сообщение")
    |> assign(:message, %Message{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Все Сообщения")
    |> assign(:message, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    message = Feedback.get_message!(id)
    {:ok, _} = Feedback.delete_message(message)

    {:noreply, assign(socket, :messages, list_messages())}
  end

  defp list_messages do
    Feedback.list_messages()
  end
end
