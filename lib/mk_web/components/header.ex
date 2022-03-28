defmodule MkWeb.Components.Header do
  use Phoenix.Component
  use Phoenix.HTML

  alias MkWeb.Router.Helpers, as: Routes
  alias Phoenix.LiveView.JS

  def header(assigns) do
    ~H"""
    <div class="sticky top-0 z-20 bg-gradient-to-tl from-slate-300 to-slate-200 px-4 py-2 xs:py-4 sm:py-10 mx-auto md:px-24 lg:px-8">
      <div class="flex items-center justify-between">
        <div class="flex items-center">
          <a href="/" aria-label="Company" title="Company" class="inline-flex items-center mr-8">
            <svg class="w-8 text-deep-purple-accent-400" viewBox="0 0 24 24" stroke-linejoin="round" stroke-width="2" stroke-linecap="round" stroke-miterlimit="10" stroke="currentColor" fill="none">
              <rect x="3" y="1" width="7" height="12"></rect>
              <rect x="3" y="17" width="7" height="6"></rect>
              <rect x="14" y="1" width="7" height="6"></rect>
              <rect x="14" y="11" width="7" height="12"></rect>
            </svg>
            <span class="ml-2 xs:text-xl font-bold tracking-wide text-gray-800 uppercase">Company</span>
          </a>
          <ul class="items-center hidden space-x-8 lg:flex text-gray-800 tracking-wide font-medium">
            <li><a href="/" aria-label="Our product" title="Our product" class="hover:text-blue-800 cursor-pointer transition-colors duration-200 hover:text-deep-purple-accent-400">О компании</a></li>
            <li><a href="/" aria-label="Our product" title="Our product" class="hover:text-blue-800 cursor-pointer transition-colors duration-200 hover:text-deep-purple-accent-400">Наши работы</a></li>
            <li><a href="/" aria-label="About us" title="About us" class="hover:text-blue-800 cursor-pointer transition-colors duration-200 hover:text-deep-purple-accent-400">Связаться с нами</a></li>
          </ul>
        </div>
        <ul class="flex-col items-center hidden lg:flex">
          <li class="text-gray-800 hover:text-blue-800 focus:text-blue-800">
            <a aria-label="whatsup" title="What's App для связи" href="tel:+78632103776" class="font-semibold sm:text-xl">+7 (863) 210-37-76</a>
          </li>
          <li class="text-gray-800 hover:text-blue-800 focus:text-gray-50">
            <a aria-label="whatsup" title="What's App для связи" href="tel:+78632103776" class="font-semibold sm:text-xl">+7 (863) 210-37-76</a>
          </li>
        </ul>
        <!-- Mobile menu -->
        <div class="lg:hidden" phx-click={show_header()} phx-click-away={hide_modal()} phx-remove={hide_modal()}>
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
                  <a href="/" aria-label="Company" title="Company" class="inline-flex items-center">
                    <svg class="w-8 text-slate-200" viewBox="0 0 24 24" stroke-linejoin="round" stroke-width="2" stroke-linecap="round" stroke-miterlimit="10" stroke="currentColor" fill="none">
                      <rect x="3" y="1" width="7" height="12"></rect>
                      <rect x="3" y="17" width="7" height="6"></rect>
                      <rect x="14" y="1" width="7" height="6"></rect>
                      <rect x="14" y="11" width="7" height="12"></rect>
                    </svg>
                    <span class="ml-2 text-xl font-bold tracking-wide text-slate-200 uppercase">Company</span>
                  </a>
                </div>
                <button aria-label="Close Menu" title="Close Menu" class="p-2 -mt-2 -mr-2 transition duration-200 rounded hover:bg-gray-600 focus:bg-gray-600" phx-click={hide_modal()}>
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
                  <li><a href="/" aria-label="Our product" title="Our product" class="font-semibold text-xl xs:text-2xl sm:text-3xl md:text-4xl tracking-widest transition-colors duration-200">О компании</a></li>
                  <li><a href="/" aria-label="Our product" title="Our product" class="font-semibold text-xl xs:text-2xl sm:text-3xl md:text-4xl tracking-widest transition-colors duration-200">Наши работы</a></li>
                  <li><a href="/" aria-label="About us" title="About us" class="font-semibold text-xl xs:text-2xl sm:text-3xl md:text-4xl tracking-widest transition-colors duration-200">Связаться с нами</a></li>
                  <li><a href="tel:+78632103776" aria-label="whatsup" title="What's App для связи" class="font-semibold text-xl xs:text-2xl sm:text-3xl md:text-4xl tracking-widest transition-colors duration-200">+7 (863) 210-37-76</a></li>
                  <li><a href="tel:+78632103776" aria-label="whatsup" title="What's App для связи" class="font-semibold text-xl xs:text-2xl sm:text-3xl md:text-4xl tracking-widest transition-colors duration-200">+7 (863) 210-37-76</a></li>
                </ul>
              </nav>
            </div>
          </div>
          <!-- Mobile menu dropdown -->
        </div>
      </div>
    </div>
    """
  end

  defp show_header(js \\ %JS{}) do
    js
    |> JS.show(to: "#header", transition: "fade-out")
    |> JS.add_class("overflow-hidden", to: "#body")
  end

  defp hide_modal(js \\ %JS{}) do
    js
    |> JS.hide(to: "#header", transition: "fade-out")
    |> JS.hide(to: "#header", transition: "fade-out-scale")
    |> JS.remove_class("overflow-hidden", to: "#body")
  end
end
