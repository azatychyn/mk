defmodule MkWeb.PolicyLive do
  use MkWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    "https://skolkovo.ru/"
    socket =
      socket
      |> assign(:page_title, "Согласие на обработку персональных данных")
      |> assign(:site, "https://skolkovo.ru/")
    {:ok, socket}
  end

  @impl true
  def handle_params(_params, _url, socket),
    do: {:noreply, socket}
end
