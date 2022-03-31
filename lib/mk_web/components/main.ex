defmodule MkWeb.Components.Main do
  use Phoenix.Component
  use Phoenix.HTML

  alias MkWeb.Router.Helpers, as: Routes

  def categories(assigns) do
    ~H"""
    <ul class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 xl:grid-cols-4 grid-rows-2 gap-4 mb-12 sm:mb-16 md:mb-20 lg:mb-24">
      <li class="md:col-span-2 bg-gray-400 relative h-52 md:h-60 lg:h-72 xl:h-96 overflow-hidden cursor-pointer">
        <a href={Routes.category_show_path(MkWeb.Endpoint, :show, @categories["warehouse"].id)}>
          <img src={extract_image(@categories, "warehouse")} class="object-cover h-full w-full lg:hover:scale-125 transform-gpu transition"/>
          <p class="absolute bottom-0 bg-gray-800 w-full bg-opacity-60 text-gray-200 text-lg sm:text-xl md:text-2xl lg:text-3xl p-1 sm:p-2 md:p-3 lg:p-4" ><%= extract_name(@categories, "warehouse") %></p>
        </a>
      </li>
      <li class="md:row-span-2 bg-gray-400 h-52 sm:h-auto relative overflow-hidden cursor-pointer">
        <a href={Routes.category_show_path(MkWeb.Endpoint, :show, @categories["greenhouse"].id)}>
          <img src={extract_image(@categories, "greenhouse")} class="object-cover h-full w-full lg:hover:scale-125 transform-gpu transition"/>
          <p class="absolute bottom-0 bg-gray-800 w-full bg-opacity-60 text-gray-200 text-lg sm:text-xl md:text-2xl lg:text-3xl p-1 sm:p-2 md:p-3 lg:p-4"><%= extract_name(@categories, "greenhouse") %></p>
        </a>
      </li>
      <li class="bg-gray-400 relative h-52 md:h-60 lg:h-72 xl:h-96 overflow-hidden cursor-pointer">
        <a href={Routes.category_show_path(MkWeb.Endpoint, :show, @categories["agriculture"].id)}>
          <img src={extract_image(@categories, "agriculture")} class="object-cover w-full h-full lg:hover:scale-125 transform-gpu transition"/>
          <p class="absolute bottom-0 bg-gray-800 w-full bg-opacity-60 text-gray-200 text-lg sm:text-xl md:text-2xl lg:text-3xl p-1 sm:p-2 md:p-3 lg:p-4"><%= extract_name(@categories, "agriculture") %></p>
        </a>
      </li>
      <li class="bg-gray-400 relative h-52 md:h-60 lg:h-72 xl:h-96 overflow-hidden cursor-pointer">
        <a href={Routes.category_show_path(MkWeb.Endpoint, :show, @categories["logistic"].id)}>
          <img src={extract_image(@categories, "logistic")} class="object-cover w-full h-full lg:hover:scale-125 transform-gpu transition"/>
          <p class="absolute bottom-0 bg-gray-800 w-full bg-opacity-60 text-gray-200 text-lg sm:text-xl md:text-2xl lg:text-3xl p-1 sm:p-2 md:p-3 lg:p-4"><%= extract_name(@categories, "logistic") %></p>
        </a>
      </li>
      <li class="bg-gray-400 relative h-52 md:h-60 lg:h-72 xl:h-96 overflow-hidden cursor-pointer">
        <a href={Routes.category_show_path(MkWeb.Endpoint, :show, @categories["auto_service"].id)}>
          <img src={extract_image(@categories, "auto_service")} class="object-cover w-full h-full lg:hover:scale-125 transform-gpu transition"/>
          <p class="absolute bottom-0 bg-gray-800 w-full bg-opacity-60 text-gray-200 text-lg sm:text-xl md:text-2xl lg:text-3xl p-1 sm:p-2 md:p-3 lg:p-4"><%= extract_name(@categories, "auto_service") %></p>
        </a>
      </li>
      <li class="lg:col-span-2 xl:col-span-1 bg-gray-400 relative h-52 md:h-60 lg:h-72 xl:h-96 overflow-hidden cursor-pointer">
        <a href={Routes.category_show_path(MkWeb.Endpoint, :show, @categories["sport"].id)}>
          <img src={extract_image(@categories, "sport")} class="object-cover w-full w-full h-full lg:hover:scale-125 transform-gpu transition"/>
          <p class="absolute bottom-0 bg-gray-800 w-full bg-opacity-60 text-gray-200 text-lg sm:text-xl md:text-2xl lg:text-3xl p-1 sm:p-2 md:p-3 lg:p-4"><%= extract_name(@categories, "sport") %></p>
        </a>
      </li>
      <li class="lg:col-span-3 xl:col-span-2 bg-gray-400 relative h-52 md:h-60 lg:h-72 xl:h-96 overflow-hidden cursor-pointer">
        <a href={Routes.category_show_path(MkWeb.Endpoint, :show, @categories["awnings"].id)}>
          <img src={extract_image(@categories, "awnings")} class="object-cover w-full h-full lg:hover:scale-125 transform-gpu transition"/>
          <p class="absolute bottom-0 bg-gray-800 w-full bg-opacity-60 text-gray-200 text-lg sm:text-xl md:text-2xl lg:text-3xl p-1 sm:p-2 md:p-3 lg:p-4"><%= extract_name(@categories, "awnings") %></p>
        </a>
      </li>
      <li class="lg:col-span-3 xl:col-span-2 bg-gray-400 relative h-52 md:h-60 lg:h-72 xl:h-96 overflow-hidden cursor-pointer">
        <a href={Routes.category_show_path(MkWeb.Endpoint, :show, @categories["aviation"].id)}>
          <img src={extract_image(@categories, "aviation")} class="object-cover w-full h-full lg:hover:scale-125 transform-gpu transition"/>
          <p class="absolute bottom-0 bg-gray-800 w-full bg-opacity-60 text-gray-200 text-lg sm:text-xl md:text-2xl lg:text-3xl p-1 sm:p-2 md:p-3 lg:p-4"><%= extract_name(@categories, "aviation") %></p>
        </a>
      </li>
    </ul>
    """
  end

  def advantages(assigns) do
    ~H"""
    <section class="text-gray-600 body-font px-2 xs:px-0 mx-auto mb-12 sm:mb-16 md:mb-20 lg:mb-24">
      <h1 class="first-line:text-4xl text-2xl md:text-4xl md:first-line:text-5xl lg:first-line:text-6xl lg:text-5xl text-center mb-12 sm:mb-16 md:mb-20 lg:mb-24 font-bold title-font text-gray-900">
        Преимущество работать с нами
      </h1>
      <ul class="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-3 gap-4 ">
        <li class="rounded-lg h-full bg-gray-100 p-4 xs:p-8">
          <div class="flex items-center mb-3">
            <div class="w-8 h-8 mr-3 text-slate-500 flex-shrink-0">
              <%= MkWeb.IconView.render(MkWeb.IconView, "check_datalist.html") %>
            </div>
            <p class="text-gray-900 text-2xl title-font font-semibold text-xl">Фиксированные цены</p>
          </div>
          <p class="leading-relaxed text-xl text-warm-gray-500">Окончательная смета у вас на руках еще до начала работ, забудьте про неожиданные дополнительные работы и пересчеты. Это помогает заказчику распланировать бюджет.</p>
        </li>
        <li class="rounded-lg h-full bg-gray-100 p-4 xs:p-8">
          <div class="flex items-center mb-3">
            <div class="w-8 h-8 mr-3 text-slate-500 flex-shrink-0">
              <%= MkWeb.IconView.render(MkWeb.IconView, "pay_cash.html") %>
            </div>
            <p class="text-gray-900 text-2xl title-font font-semibold text-xl">Поэтапная оплата</p>
          </div>
          <p class="leading-relaxed text-xl text-warm-gray-500">Расчет за каждый этап работ производится только после подписания актов выполненных работ и отсутствия замечаний со стороны заказчика. У нас сначала стулья, а затем деньги.</p>
        </li>
        <li class="rounded-lg h-full bg-gray-100 p-4 xs:p-8">
          <div class="flex items-center mb-3">
            <div class="w-8 h-8 mr-3 text-slate-500 flex-shrink-0">
              <%= MkWeb.IconView.render(MkWeb.IconView, "calendar.html") %>
            </div>
            <p class="text-gray-900 text-2xl title-font font-semibold text-xl">Соблюдение сроков</p>
          </div>
          <p class="leading-relaxed text-xl text-warm-gray-500">Несем материальную ответственность за несоблюдение сроков, указанных в договоре. Время = деньги.</p>
        </li>
        <li class="rounded-lg h-full bg-gray-100 p-4 xs:p-8">
          <div class="flex items-center mb-3">
            <div class="w-8 h-8 mr-3 text-slate-500 flex-shrink-0">
            <%= MkWeb.IconView.render(MkWeb.IconView, "people_group.html") %>
            </div>
            <p class="text-gray-900 text-2xl title-font font-semibold text-xl">Опытный коллектив</p>
          </div>
          <p class="leading-relaxed text-xl text-warm-gray-500">Наш профессиональный и дружный коллектив сформировался еще более 10 лет назад. Всегда можете приехать к нам в офис и убедиться в этом сами.</p>
        </li>
        <li class="rounded-lg h-full bg-gray-100 p-4 xs:p-8">
          <div class="flex items-center mb-3">
            <div class="w-8 h-8 mr-3 text-slate-500 flex-shrink-0">
              <%= MkWeb.IconView.render(MkWeb.IconView, "wheel_barrow.html") %>
            </div>
            <p class="text-gray-900 text-2xl title-font font-semibold text-xl">Закупка материала</p>
          </div>
          <p class="leading-relaxed text-xl text-warm-gray-500">У нас заключены договора поставки материалов по привлекательным цена у надежных поставщиков. Мы поможем сэкономить ваш бюджет.</p>
        </li>
        <li class="rounded-lg h-full bg-gray-100 p-4 xs:p-8">
          <div class="flex items-center mb-3">
            <div class="w-8 h-8 mr-3 text-slate-500 flex-shrink-0">
              <%= MkWeb.IconView.render(MkWeb.IconView, "quality.html") %>
            </div>
            <p class="text-gray-900 text-2xl title-font font-semibold text-xl">Гарантия 2 года</p>
          </div>
          <p class="leading-relaxed text-xl text-warm-gray-500">Мы всегда даем гарантию на весь спектр выполненных работ. Качество для нас превыше всего.</p>
        </li>
      </ul>
    </section>
    """
  end

  def introduction(assigns) do
    ~H"""
    <!-- desktop -->
    <div class="relative hidden lg:flex py-16 flex-col mt-16 antialiased">
      <div class="inset-y-0 top-0 right-0 z-0 w-full max-w-xl w-7/12 lg:max-w-full lg:absolute xl:px-0">
        <svg class="absolute left-0 h-full text-white transform -translate-x-1/2" viewBox="0 0 100 100" fill="currentColor" preserveAspectRatio="none slice">
          <path d="M50 0H100L50 100H0L50 0Z"></path>
        </svg>
        <img
          class="object-cover w-full h-56 rounded shadow-lg lg:rounded-none lg:shadow-none md:h-96 lg:h-full"
          src={Routes.static_path(MkWeb.Endpoint, "/images/main_img.jpeg")}
          alt=""
        />
      </div>
      <div class="relative px-2 my-48">
        <p class="text-7xl font-bold text-deep-purple-accent-400">Совершенно новый</p>
        <div class="max-w-xl pr-5">
          <p class="mb-5 text-gray-900 uppercase text-6xl">
            Подход к возведению <br class="hidden md:block" />конструкций,
            <span class="inline-block text-deep-purple-accent-400 font-medium text-4xl normal-case">которые можно <br class="" /> только представить</span>
          </p>
          <p class="text-gray-700 text-xl">
            Строительство металлоконструкций любой сложноси. Исплльзовние профессиональной техники и методики строительства.
          </p>
        </div>
      </div>
    </div>
    <!-- desktop -->
    <!-- mobile -->
    <div class="relative lg:hidden antialiased h-96 sm:h-[520px] sm:py-36">
      <div class="absolute inset-0 z-0">
        <img
          class="object-cover w-full h-full"
          src={Routes.static_path(MkWeb.Endpoint, "/images/main_img.jpeg")}
          alt="main_image"
        />
      </div>
      <div class="flex flex-col justify-center relative text-center bg-slate-800 bg-opacity-70 backdrop-invert backdrop-opacity-20 max-w-2xl mx-auto rounded p-4 h-full sm:h-auto">
        <p class="text-gray-100 text-xl xs:text-2xl sm:text-3xl md:text-4xl font-bold uppercase mb-2">совершенно новый</p>
        <p class="text-gray-200 mb-5 uppercase text-lg xs:text-xl sm:text-2xl md:text-3xl font-semibold">
          Подход к возведению конструкций,
          <span class="inline-block text-deep-purple-accent-400">которые можно <br class="xs:hidden" /> только представить</span>
        </p>
        <p class="text-gray-300 md:text-xl">
          Строительство металлоконструкций любой сложноси. Исплльзовние профессиональной техники и методики строительства.
        </p>
      </div>

    </div>
    <!-- mobile -->
    """
  end

  def about_compamy(assigns) do
    ~H"""
    <section class="mt-12 sm:mt-16 md:mt-20 xl:mt-24 mb-12 sm:mb-16 md:mb-20 lg:mb-24">
      <h1 class="first-line:text-4xl text-2xl md:text-4xl md:first-line:text-5xl lg:first-line:text-6xl lg:text-5xl text-center mb-12 sm:mb-16 md:mb-20 lg:mb-24 font-bold uppercase">о компании</h1>
      <p class="text-lg xs:text-xl sm:text-2xl lg:text-3xl xl:text-4xl px-2 mb-12 sm:mb-16 md:mb-20 lg:mb-24 text-center">
        Мы - это <strong>группа компаний "АРГО"</strong>. Мы надёжная и добросовестная торгово-производственная группа компаний , имеющая богатый опыт в строительстве, в сфере производства и в грузоперевозках.
      </p>
      <div class="mb-12 sm:mb-16 md:mb-20 lg:mb-24">
        <img
          class="object-cover w-full h-full max-h-[720px]"
          src={Routes.static_path(MkWeb.Endpoint, "/images/company_img.jpeg")}
          alt="company_img"
        />
      </div>
      <h2 class="text-xl xs:text-2xl sm:text-3xl lg:text-4xl xl:text-5xl font-bold px-2 mb-4 sm:mb-8 md:mb-12 lg:mb-16 text-center">Наши основные напрвления</h2>
      <ul class="grid md:grid-cols-2 gap-4 sm:gap-12 text-center mb-12 sm:mb-16 md:mb-20 lg:mb-24">
        <li class="p-4">
          <h2 class="text-gray-900 text-xl sm:text-2xl md:text-2xl lg:text-4xl font-semibold uppercase mb-3">металлоконструкции</h2>
          <p class="sm:text-lg lg:text-xl mb-4">Возведение зданий любой сложности на основе металлоконструкций</p>
          <div class="">
            <img
              class="object-cover w-full h-full max-h-[280px] md:max-h-[400px]"
              src={Routes.static_path(MkWeb.Endpoint, "/images/metal_construction.jpeg")}
              alt="company_img"
            />
          </div>
        </li>
        <li class="p-4">
          <h2 class="text-gray-900 text-xl sm:text-2xl md:text-2xl lg:text-4xl font-semibold uppercase mb-3">грузоперевозки</h2>
          <p class="sm:text-lg lg:text-xl mb-4">Перевозка грузов (практически любой категории) и по всей России </p>
          <div class="">
            <img
              class="object-cover w-full h-full max-h-[280px] md:max-h-[400px]"
              src={Routes.static_path(MkWeb.Endpoint, "/images/car.jpeg")}
              alt="company_img"
            />
          </div>
        </li>
      </ul>
      <h3 class="text-xl xs:text-2xl sm:text-3xl lg:text-4xl xl:text-5xl font-bold px-2 mb-4 sm:mb-8 md:mb-12 lg:mb-16 text-center">
        Подробнее о нас
      </h3>
      <ul class="mb-12 sm:mb-16 md:mb-20 lg:mb-24">
        <li class="text-lg sm:text-xl lg:text-2xl pb-2 sm:mb-4 px-2 sm:px-0">
          В компании работают только высококлассные специалисты, прошедшие обучение и аттестацию. Мы считаем, что высокий профессионализм и опыт сотрудников прежде всего экономят время и средства покупателя.
        </li>
        <li class="text-lg sm:text-xl lg:text-2xl pb-2 sm:mb-4 px-2 sm:px-0">
          Больше 10 лет мы занимаемся быстровозводимыми металлическими конструкциями. Мы накопили немалый опыт и обрели практические навыки строительства, которые помогут сохранить время и деньги наших клиентов.
        </li>
        <li class="text-lg sm:text-xl lg:text-2xl pb-2 sm:mb-4 px-2 sm:px-0">
          Наша компания оказывает услуги по перевозке грузов автомобильным транспортом по России. В нашем автопарке есть различный транспорт подходящий для перевозки практически любого груза.
        </li>
      </ul>
      <h3 class="text-xl xs:text-2xl sm:text-3xl lg:text-4xl xl:text-5xl font-bold px-2 mb-4 sm:mb-8 md:mb-12 lg:mb-16 text-center">Контактная информация</h3>
      <ul class="grid md:grid-cols-3 gap-4 md:gap-8 lg:gap-12 text-left md:text-center mb-12 sm:mb-16 md:mb-20 lg:mb-24 px-2">
        <li class="pb-4">
          <a aria-label="tel" title="Телефон для связи" href="tel:+79605722001">
            <p class="text-gray-900 text-xl sm:text-2xl md:text-2xl lg:text-3xl xl:text-3-xl font-semibold uppercase mb-3">Номер телефона</p>
            <p class="sm:text-lg lg:text-xl">+7 (960) 572-20-01</p>
          </a>
        </li>
        <li class="pb-4">
          <a aria-label="email" title="Почта для связи" href="mailto:gagik.nazarian@yandex.ru?subject=Заказ">
            <p class="text-gray-900 text-xl sm:text-2xl md:text-2xl lg:text-3xl xl:text-3-xl font-semibold uppercase mb-3">Почта</p>
            <p class="sm:text-lg lg:text-xl">gagik.nazarian@yandex.ru</p>
          </a>
        </li>
        <li class="pb-4">
          <a aria-label="adress" title="Адрес Компании">
            <p class="text-gray-900 text-xl sm:text-2xl md:text-2xl lg:text-3xl xl:text-3-xl font-semibold uppercase mb-3">Адрес</p>
            <p class="sm:text-lg lg:text-xl">390047, Рязанская обл, Рязань г, Куйбышевское ш, дом 41, помещение Н1, офис 319</p>
          </a>
        </li>
      </ul>
      <p class="text-xl xs:text-2xl sm:text-3xl lg:text-4xl xl:text-5xl font-bold px-2 mb-4 sm:mb-8 md:mb-12 lg:mb-16 text-center">Реквизиты</p>
      <ul class="grid xl:grid-cols-3 gap-4 sm:gap-12 text-center mb-12 sm:mb-16 md:mb-20 lg:mb-24">
        <li class="block xl:hidden h-2 bg-slate-200" />
        <li class="">
          <p class="text-lg lg:text-xl xl:text-2xl font-bold px-2 mb-4 text-left">ООО  "СТК АРГО"</p>
          <ul class="grid grid-cols-7 text-left text-lg sm:text-xl md:text-2xl">
            <li class="p-1 col-span-2 font-semibold">ИНН:</li>
            <li class="p-1 col-span-5">6230118008</li>
            <li class="p-1 col-span-2 font-semibold">КПП:</li>
            <li class="p-1 col-span-5">623001001</li>
            <li class="p-1 col-span-2 font-semibold">ОГРН:</li>
            <li class="p-1 col-span-5">1206200009487</li>
            <li class="p-1 col-span-full font-semibold">Генеральный директор:</li>
            <li class="px-1 col-span-full">Назарян Гагик Грачикович</li>
            <li class="p-1 col-span-full font-semibold">Юридический адрес:</li>
            <li class="px-1 col-span-full">390047, Рязанская обл, Рязань г, Куйбышевское ш, дом 41, помещение Н1, офис 319</li>
          </ul>
        </li>
        <li class="block xl:hidden h-2 bg-slate-200" />
        <li class="">
          <p class="text-lg lg:text-xl xl:text-2xl font-bold px-2 mb-4 text-left">ООО  "АГРО-СТРОЙ"</p>
          <ul class="grid grid-cols-7 text-left text-lg sm:text-xl md:text-2xl">
            <li class="p-1 col-span-2 font-semibold">ИНН:</li>
            <li class="p-1 col-span-5">6230096900</li>
            <li class="p-1 col-span-2 font-semibold">КПП:</li>
            <li class="p-1 col-span-5">623001001</li>
            <li class="p-1 col-span-2 font-semibold">ОГРН:</li>
            <li class="p-1 col-span-5">1166234059375</li>
            <li class="p-1 col-span-full font-semibold">Генеральный директор:</li>
            <li class="px-1 col-span-full">Назарян Гагик Грачикович</li>
            <li class="p-1 col-span-full font-semibold">Юридический адрес:</li>
            <li class="px-1 col-span-full">390047, Рязанская обл, Рязань г, Куйбышевское ш, дом 41, корпус Литера "А", помещение Н1, офис 210</li>
          </ul>
        </li>
        <li class="block xl:hidden h-2 bg-slate-200" />
        <li class="">
          <p class="text-lg lg:text-xl xl:text-2xl font-bold px-2 mb-4 text-left">ООО  "АГРО-СТРОЙ H"</p>
          <ul class="grid grid-cols-7 text-left text-lg sm:text-xl md:text-2xl">
            <li class="p-1 col-span-2 font-semibold">ИНН:</li>
            <li class="p-1 col-span-5">5249161421</li>
            <li class="p-1 col-span-2 font-semibold">КПП:</li>
            <li class="p-1 col-span-5">524901001</li>
            <li class="p-1 col-span-2 font-semibold">ОГРН:</li>
            <li class="p-1 col-span-5">-</li>
            <li class="p-1 col-span-full font-semibold">Генеральный директор:</li>
            <li class="px-1 col-span-full">Назарян Гагик Грачикович</li>
            <li class="p-1 col-span-full font-semibold">Юридический адрес:</li>
            <li class="px-1 col-span-full">606000, Нижегородская обл, г. Дзержинск, ул. Пирогова, д. 37Б, офис 1</li>
          </ul>
        </li>
        <li class="block xl:hidden h-2 bg-slate-200" />
      </ul>
    </section>
    """
  end

  defp extract_image(categories, label) do
    categories
    |> Map.get(label)
    |> Map.get(:image)
    |> Map.get(:image_path)
  end

  defp extract_name(categories, label) do
    categories
    |> Map.get(label)
    |> Map.get(:name)
  end
end
