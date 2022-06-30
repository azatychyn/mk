defmodule MkWeb.PageLive do
  use MkWeb, :live_view

  alias Mk.Categories
  alias Mk.Feedback.Message
  alias Phoenix.LiveView.JS

  @steps [
    %{label: "Замер", content: "Бесплатный выезд нашего специалиста на Ваш объект"},
    %{label: "Смета", content: "Бесплатное составление сметы"},
    %{label: "Контракт", content: "Заключим в любом удобном для Вас месте"},
    %{label: "Строительство", content: "С Вас только приемка оговоренных этапов работ"},
    %{label: "Подготовка", content: "Мы не привыкли оставлять после себя мусор"},
    %{label: "Сдача", content: "Приемка всего объекта"}
  ]

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:message_title, "Оставить заявку")
      |> assign(:message, %Message{})
      |> assign(:steps, @steps)
      |> assign(:current_folder, nil)
      |> assign(:images, [])
      |> assign(:slide_name, "")
      |> assign(:categories, Categories.map_categories())

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket),
    do: {:noreply, apply_action(socket, socket.assigns.live_action, params)}

  def apply_action(socket, :slider, params) do
    %{"sl_img" => images, "name" => slide_name} = params

    socket
    |> assign(:images, images)
    |> assign(:slide_name, slide_name)
  end

  def apply_action(socket, _url, _params),
    do: socket

  defp get_first_img([%{image_path: image_path} | _rest]),
    do: image_path

  def get_img_paths(images),
    do: Enum.map(images, & &1.image_path)

  defp lock_body(js \\ %JS{}),
    do: JS.add_class(js, "overflow-hidden", to: "#body")
end
