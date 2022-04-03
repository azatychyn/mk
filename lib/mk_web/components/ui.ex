defmodule MkWeb.Components.UI do
  use Phoenix.Component
  use Phoenix.HTML

  alias MkWeb.Router.Helpers, as: Routes
  alias Phoenix.LiveView.JS

  def header(assigns) do
    ~H"""
    <div class="sticky top-0 z-20 bg-gradient-to-tl from-slate-300 to-slate-200 px-4 py-2 xs:py-4 sm:py-8 mx-auto md:px-4 lg:px-8">
      <div class="flex items-center justify-between">
        <div class="flex items-center">
          <%= live_patch to: Routes.page_path(@socket, :index), "aria-label": "Company", title: "Компания", class: "inline-flex items-center mr-8" do %>
            <svg class="w-8 text-deep-purple-accent-400" viewBox="0 0 24 24" stroke-linejoin="round" stroke-width="2" stroke-linecap="round" stroke-miterlimit="10" stroke="currentColor" fill="none">
              <rect x="3" y="1" width="7" height="12"></rect>
              <rect x="3" y="17" width="7" height="6"></rect>
              <rect x="14" y="1" width="7" height="6"></rect>
              <rect x="14" y="11" width="7" height="12"></rect>
            </svg>
            <span class="ml-2 xs:text-xl font-bold tracking-wide text-gray-800 uppercase">cтк арго</span>
          <% end %>
          <ul class="items-center hidden space-x-8 lg:flex text-gray-800 tracking-wide font-medium">
            <li><a aria-label="About company" title="about_company" data-easing="linear" href="#about_company" class="hover:text-blue-800 cursor-pointer transition-colors duration-200 hover:text-deep-purple-accent-400">О компании</a></li>
            <li><a aria-label="Our product" title="Our product" data-easing="linear" href="#our_works" class="hover:text-blue-800 cursor-pointer transition-colors duration-200 hover:text-deep-purple-accent-400">Наши работы</a></li>
            <li><a aria-label="Contact us" title="Contact us" data-easing="linear" href="#contact" class="hover:text-blue-800 cursor-pointer transition-colors duration-200 hover:text-deep-purple-accent-400">Связаться с нами</a></li>
          </ul>
        </div>
        <p class="hidden lg:flex text-gray-800 hover:text-blue-800 focus:text-gray-50">
          <a aria-label="whatsup" title="What's App для связи" href="tel:+79605722001" class="font-semibold sm:text-xl">+7 (960) 572-20-01</a>
        </p>
        <!-- Mobile menu -->
        <div class="lg:hidden" phx-click={show_header()} phx-click-away={hide_header()} phx-remove={hide_header()}>
          <button aria-label="Open Menu" title="Open Menu" class="p-2 -mr-1 transition duration-200 rounded text-slate-200 focus:outline-none focus:shadow-outline hover:bg-deep-purple-50 focus:bg-deep-purple-50">
            <svg class="w-8 sm:w-10 text-gray-600" viewBox="0 0 24 24">
              <path fill="currentColor" d="M23,13H1c-0.6,0-1-0.4-1-1s0.4-1,1-1h22c0.6,0,1,0.4,1,1S23.6,13,23,13z"></path>
              <path fill="currentColor" d="M23,6H1C0.4,6,0,5.6,0,5s0.4-1,1-1h22c0.6,0,1,0.4,1,1S23.6,6,23,6z"></path>
              <path fill="currentColor" d="M23,20H1c-0.6,0-1-0.4-1-1s0.4-1,1-1h22c0.6,0,1,0.4,1,1S23.6,20,23,20z"></path>
            </svg>
          </button>
          <!-- Mobile menu dropdown -->
          <div id="header" class="hidden absolute text-slate-200 top-0 left-0 w-full z-20 h-screen bg-slate-900 opacity-90">
            <div class="p-5">
              <div class="flex items-center justify-between mb-4">
                <div>
                  <%= live_patch to: Routes.page_path(@socket, :index), "aria-label": "Company", title: "Company", class: "inline-flex items-center" do %>
                    <svg class="w-8 text-slate-200" viewBox="0 0 24 24" stroke-linejoin="round" stroke-width="2" stroke-linecap="round" stroke-miterlimit="10" stroke="currentColor" fill="none">
                      <rect x="3" y="1" width="7" height="12"></rect>
                      <rect x="3" y="17" width="7" height="6"></rect>
                      <rect x="14" y="1" width="7" height="6"></rect>
                      <rect x="14" y="11" width="7" height="12"></rect>
                    </svg>
                    <span class="ml-2 text-xl font-bold tracking-wide text-slate-200 uppercase">cтк арго</span>
                  <% end %>
                </div>
                <button aria-label="Close Menu" title="Close Menu" class="p-2 -mt-2 -mr-2 transition duration-200 rounded hover:bg-gray-600 focus:bg-gray-600" phx-click={hide_header()}>
                  <svg class="w-8 sm:w-10 text-slate-200" viewBox="0 0 24 24">
                    <path
                      fill="currentColor"
                      d="M19.7,4.3c-0.4-0.4-1-0.4-1.4,0L12,10.6L5.7,4.3c-0.4-0.4-1-0.4-1.4,0s-0.4,1,0,1.4l6.3,6.3l-6.3,6.3 c-0.4,0.4-0.4,1,0,1.4C4.5,19.9,4.7,20,5,20s0.5-0.1,0.7-0.3l6.3-6.3l6.3,6.3c0.2,0.2,0.5,0.3,0.7,0.3s0.5-0.1,0.7-0.3 c0.4-0.4,0.4-1,0-1.4L13.4,12l6.3-6.3C20.1,5.3,20.1,4.7,19.7,4.3z"
                    ></path>
                  </svg>
                </button>
              </div>
              <nav>
                <ul class="space-y-4 ppercase underline">
                  <li><a phx-click={hide_header()} data-easing="linear" href="#about_company" aria-label="Our product" title="Our product" class="font-semibold text-xl xs:text-2xl sm:text-3xl md:text-4xl tracking-widest transition-colors duration-200">О компании</a></li>
                  <li><a phx-click={hide_header()} data-easing="linear" href="#our_works" aria-label="Our product" title="Our product" class="font-semibold text-xl xs:text-2xl sm:text-3xl md:text-4xl tracking-widest transition-colors duration-200">Наши работы</a></li>
                  <li><a phx-click={hide_header()} data-easing="linear" href="#contact" aria-label="About us" title="About us" class="font-semibold text-xl xs:text-2xl sm:text-3xl md:text-4xl tracking-widest transition-colors duration-200">Связаться с нами</a></li>
                  <li><a href="tel:+79605722001" aria-label="whatsup" title="What's App для связи" class="font-semibold text-xl xs:text-2xl sm:text-3xl md:text-4xl tracking-widest transition-colors duration-200">+7 (960) 572-20-01</a></li>
                </ul>
              </nav>
            </div>
          </div>
          <!-- Mobile menu dropdown -->
        </div>
      </div>
      <%= if @current_user do %>
        <MkWeb.Components.UI.admin_panel assigns: @assigns />
      <% end %>
    </div>
    """
  end

  def footer(assigns) do
    ~H"""
    <section class="bg-gradient-to-tl from-slate-300 to-slate-200 px-2 xs:px-4 sm:py-10 mx-auto md:px-4 lg:px-8 md:py-24">
      <ul class="grid md:grid-cols-2 gap-16 md:gap-y-32">
        <li class="">
          <p class="text-lg sm:text-lg md:text-xl lg:text-2xl font-bold text-left uppercase mb-4">адрес</p>
          <p class="text-lg xl:text-xl font-bold text-left pb-4">ООО  "СТК АРГО"</p>
          <ul class="grid grid-cols-7 text-left text-lg md:text-xl max-w-sm">
            <li class="md:p-1 col-span-2 font-semibold">ИНН:</li>
            <li class="md:p-1 col-span-5">6230118008</li>
            <li class="md:p-1 col-span-2 font-semibold">КПП:</li>
            <li class="md:p-1 col-span-5">623001001</li>
            <li class="md:p-1 col-span-2 font-semibold">ОГРН:</li>
            <li class="md:p-1 col-span-5">1206200009487</li>
            <li class="md:p-1 md:pt-4 col-span-full font-semibold">Генеральный директор:</li>
            <li class="px-1 pb-4 col-span-full">Назарян Гагик Грачикович</li>
            <li class="p-1 col-span-full font-semibold">Юридический адрес:</li>
            <li class="px-1 col-span-full">390047, Рязанская обл, Рязань г, Куйбышевское ш, дом 41, помещение Н1, офис 319</li>
          </ul>
        </li>
        <li class="">
          <p class="sm:text-lg md:text-xl lg:text-2xl font-bold text-left mb-4 uppercase">Контакты</p>
          <ul class="grid text-left text-lg md:text-xl">
            <li class="text-lg xl:text-xl font-bold text-left pb-4 uppercase">Телефон:</li>
            <li class="p-1 pb-4 break-words">
              <a aria-label="whatsup" title="What's App для связи" href="tel:+79605722001">+7 (960) 572-20-01</a>
            </li>
            <li class="text-lg xl:text-xl font-bold text-left pb-4 uppercase">Почта:</li>
            <li class="p-1 pb-4 break-words">
              <a aria-label="email" title="Почта для связи" href="mailto:gagik.nazarian@yandex.ru?subject=Заказ">gagik.nazarian@yandex.ru</a>
            </li>

          </ul>
          <p class="sm:text-lg md:text-xl lg:text-2xl font-bold text-left mb-4 uppercase">Карта сайта</p>
          <ul class="grid text-left text-lg md:text-xl max-w-md">
            <li class="p-1">
              <a data-easing="linear" href="#about_company">О нас</a>
            </li>
            <li class="p-1">
              <a data-easing="linear" href="#our_works">Наши работы</a>
            </li>
            <li class="p-1">
              <a data-easing="linear" href="#contact">Связаться с нами</a>
            </li>
          </ul>
        </li>
        <li class="col-span-full">
          <p class="block md:text-lg lg:text-xl font-semibold underline text-slate-500 hover:text-blue-500 underline text-center">© Все права защищены 2022 ООО "СТК АРГО"</p>
          <%= link "Согласие на обработку персональных данных",
            to: Routes.policy_path(MkWeb.Endpoint, :policy),
            target: "_blank",
            class: "block lg:text-lg font-semibold underline text-slate-500 hover:text-blue-500 underline text-center" %>
        </li>
      </ul>
    </section>
    """
  end

  def admin_panel(assigns) do
    ~H"""
    <div class="flex flex-col xs:flex-row w-max mt-2">
      <%= live_redirect "Панель Администратора",
        to: Routes.admin_page_path(MkWeb.Endpoint, :index),
        method: :get,
        class: "text-lg lg:text-xl hover:text-slate-600 font-bold mr-4" %>
      <%= link "Выйти",
        to: Routes.user_session_path(MkWeb.Endpoint, :delete),
        method: :delete,
        class: "text-lg lg:text-xl text-rose-300 hover:text-rose-400 font-bold" %>
    </div>
    """
  end

  defp show_header(js \\ %JS{}) do
    js
    |> JS.show(to: "#header", transition: "fade-out")
    |> JS.add_class("overflow-hidden", to: "#body")
  end

  defp hide_header(js \\ %JS{}) do
    js
    |> JS.hide(to: "#header", transition: "fade-out")
    |> JS.hide(to: "#header", transition: "fade-out-scale")
    |> JS.remove_class("overflow-hidden", to: "#body")
  end
end
