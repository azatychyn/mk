defmodule MkWeb.MessageLive.Show do
  use MkWeb, :live_view

  alias Mk.Feedback

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:message, Feedback.get_message!(id))}
  end

  defp page_title(:show), do: "Show Message"
  defp page_title(:edit), do: "Edit Message"
end
