defmodule MkWeb.PolicyLive do
  use MkWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:page_title, "Согласие на обработку персональных данных")
      |> assign(:site, "https://ctk_argo.ru")
      |> assign(
        :address,
        "ООО «СТК АРГО» (ОГРН 1206200009487, адрес: 390047, Рязанская обл, Рязань г, Куйбышевское ш, дом 41, помещение Н1, офис 319"
      )

    {:ok, socket}
  end

  @impl true
  def handle_params(_params, _url, socket),
    do: {:noreply, socket}
end
