defmodule MkWeb.LiveHelpers do
  import Phoenix.LiveView
  import Phoenix.LiveView.Helpers

  alias Phoenix.LiveView.JS
  alias MkWeb.Router.Helpers, as: Routes

  @doc """
  Renders a live component inside a modal.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <.modal return_to={Routes.product_index_path(@socket, :index)}>
        <.live_component
          module={MkWeb.ProductLive.FormComponent}
          id={@product.id || :new}
          title={@page_title}
          action={@live_action}
          return_to={Routes.product_index_path(@socket, :index)}
          product: @product
        />
      </.modal>
  """
  def modal(assigns) do
    assigns = assign_new(assigns, :return_to, fn -> nil end)

    ~H"""
    <div id="modal" class="phx-modal fade-in" phx-remove={hide_modal()}>
      <div
        id="modal-content"
        class="phx-modal-content fade-in-scale py-6 xs:p-4 xs:w-10/12"
        phx-click-away={JS.dispatch("click", to: "#close")}
        phx-window-keydown={JS.dispatch("click", to: "#close")}
        phx-key="escape"
      >
        <%= if @return_to do %>
          <%= live_patch "✖",
            to: @return_to,
            id: "close",
            class: "phx-modal-close",
            phx_click: hide_modal()
          %>
        <% else %>
         <a id="close" href="#" class="phx-modal-close" phx-click={hide_modal()}>✖</a>
        <% end %>

        <%= render_slot(@inner_block) %>
      </div>
    </div>
    """
  end

  def slider_modal(assigns) do
    assigns = assign_new(assigns, :return_to, fn -> nil end)

    ~H"""
      <div
        id="slider_modal"
        class="fixed min-w-screen h-full inset-0 overflow-auto z-50 bg-black bg-opacity-80 flex items-center justify-center"
        phx-capture-click={JS.dispatch("click", to: "#close")}
        phx-click-away={JS.dispatch("click", to: "#close")}
        phx-window-keydown={JS.dispatch("click", to: "#close")}
        phx-key="escape"
        phx-target="#slider_modal"
        phx-page-loading
        >
        <div class="flex flex-col items-center justify-center w-max max-w-7xl bg-opacity-70 scale-up-center mx-auto">
          <%= live_patch "✖",
            to: @return_to || Routes.page_path(@socket, :index),
            id: "close",
            class: "text-3xl sm:text-4xl lg:text-5xl w-max ml-auto text-slate-400 hover:text-slate-200",
            phx_click: hide_slider_modal()
          %>
          <%= render_slot(@inner_block) %>
        </div>
      </div>
    """
  end

  defp hide_modal(js \\ %JS{}) do
    js
    |> JS.hide(to: "#modal", transition: "fade-out")
    |> JS.hide(to: "#modal-content", transition: "fade-out-scale")
    |> JS.remove_class("overflow-hidden", to: "#body")
  end

  defp hide_slider_modal(js \\ %JS{}) do
    js
    |> JS.hide(to: "#slider_modal", transition: "fade-out")
    |> JS.remove_class("overflow-hidden", to: "#body")
  end
end
