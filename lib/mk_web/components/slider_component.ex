defmodule MkWeb.SliderComponent do
  use MkWeb, :live_component

  def mount(socket) do
    {:ok, assign(socket, :index, 1)}
  end

  def render(assigns) do
    ~H"""
      <div class="flex flex-col">
        <div class="flex items-center justify-center">
          <button
            phx-click="prev"
            phx-target={@myself}
            phx-throttle="200"
            class="hidden sm:block w-12 sm:w-16 lg:w-24 h-12 sm:h-16 lg:h-24 text-white border-none focus:outline-none"
          >
            <%= MkWeb.IconView.render(MkWeb.IconView, "arrow-left.html") %>
          </button>
          <div class="relative">
            <button
              phx-click="prev"
              phx-target={@myself}
              phx-throttle="200"
              class="block sm:hidden absolute left-0 top-1/2 w-12 sm:w-16 lg:w-24 h-12 sm:h-16 lg:h-24 text-white border-none focus:outline-none"
            >
              <%= MkWeb.IconView.render(MkWeb.IconView, "arrow-left.html") %>
            </button>
            <img class="max-h-184" src={Routes.static_path(@socket, image(@images, @index))}>
            <button
              phx-click="next"
              phx-target={@myself}
              phx-throttle="200"
              class="block sm:hidden absolute right-0 top-1/2 w-12 sm:w-16 lg:w-24 h-12 sm:h-16 lg:h-24 text-white focus:outline-none"
            >
              <%= MkWeb.IconView.render(MkWeb.IconView, "arrow-right.html") %>
            </button>
          </div>
          <button
            phx-click="next"
            phx-target={@myself}
            phx-throttle="200"
            class="hidden sm:block w-12 sm:w-16 lg:w-24 h-12 sm:h-16 lg:h-24 text-white focus:outline-none"
          >
            <%= MkWeb.IconView.render(MkWeb.IconView, "arrow-right.html") %>
          </button>
        </div>
      </div>
    """
  end

  def handle_event("prev", _, socket) do
    index = socket.assigns.index

    if index < 1 do
      {:noreply, update(socket, :index, &(&1 - 1))}
    else
      {:noreply, socket}
    end
  end

  def handle_event("next", _, socket) do
    index = socket.assigns.index
    max_index = Enum.count(socket.assigns.images)

    if index >= max_index do
      {:noreply, assign(socket, :index, 1)}
    else
      {:noreply, update(socket, :index, &(&1 + 1))}
    end
  end

  def image(images, index) do
    images
    |> Enum.at(index - 1)
    |> image_name()
  end

  def image_name(path),
    do: path
end
