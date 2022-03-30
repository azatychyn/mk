defmodule MkWeb.AdminPageLive do
  use MkWeb, :live_view

  alias Mk.{Categories, Feedback}
  alias Mk.Feedback.Message
  alias Phoenix.LiveView.JS

  @impl true
  def mount(_params, _session, socket) do
    socket = socket

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    # IO.inspect(binding())


    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  def apply_action(socket, :slider, params) do
    %{
      "sl_fol" => current_folder,
      "sl_img" => images,
      "sl_name" => slide_name,
      "sl_desc" => slide_description
    } = params

    socket
    |> assign(:current_folder, current_folder)
    |> assign(:images, images)
    |> assign(:slide_name, slide_name)
    |> assign(:slide_description, slide_description)
  end

  def apply_action(socket, _url, _params),
    do: socket

  def works(), do: @works

  defp show_modal(id, js \\ %JS{}) do
    js
    |> JS.show(transition: "fade-out", to: "#" <> id)
    |> JS.show(transition: "fade-out-scale", to: "#modal-content")
    |> JS.add_class("overflow-hidden", to: "#body")
  end
end
