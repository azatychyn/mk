defmodule MkWeb.SliderComponent do
  use MkWeb, :live_component

  # @s3_url "https://rnd-stori-images.s3.us-west-000.backblazeb2.com"
  # @s3_url "/images"
  # @images [
  #   "5.jpg",
  #   "4.jpg",
  #   "3.jpg",
  #   "2.jpg",
  #   "1.jpg"
  # ]

  def mount(socket) do
    socket =
      socket
      # |> assign(:folder, "house_3")
      # |> assign(:images, @images)
      |> assign(:index, 1)

    {:ok, socket}
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
            <img class="max-h-184" src={Routes.static_path(@socket, image(@images, @index, @folder))}>
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
        <p class="text-xl sm:text-2xl md:text-3xl text-white text-center my-8"><%= @name %></p>
        <p class="text-sm sm:text-base text-white text-center px-4"><%= @description %>
        </p>
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

  def image(images, index, folder) do
    images
    |> Enum.at(index - 1)
    |> image_name(folder)
  end

  def image_name(image_name, folder) do
    "/images/#{folder}/#{image_name}"
  end
end
