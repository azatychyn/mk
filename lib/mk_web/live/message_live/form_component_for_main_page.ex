defmodule MkWeb.MessageLive.FormComponentForMainPage do
  use MkWeb, :live_component

  alias Mk.Feedback
  alias Mk.Feedback.Message

  @impl true
  def update(%{message: message} = assigns, socket) do
    changeset = Feedback.change_message(message)

    socket =
      socket
      |> assign(assigns)
      |> assign(:have_sent, false)
      |> assign(:changeset, changeset)

    {:ok, socket}
  end

  @impl true
  def handle_event("validate", %{"message" => message_params}, socket) do
    changeset =
      socket.assigns.message
      |> Feedback.change_message(message_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"message" => message_params}, socket) do
    case Feedback.create_message(message_params) do
      {:ok, _message} ->
        {:noreply,
         socket
         |> assign(:have_sent, true)
         |> assign(:title, "Ваше сообщение уже отправлено")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  def handle_event("new", _params, socket) do
    changeset = Feedback.change_message(%Message{})

    socket =
      socket
      |> assign(:title, "Оставить заявку")
      |> assign(have_sent: false)
      |> assign(message: %Message{})
      |> assign(:changeset, changeset)

    {:noreply, socket}
  end
end
