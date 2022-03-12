defmodule MkWeb.PageLive do
  use MkWeb, :live_view

  alias Mk.Pages
  alias Mk.Pages.Page

  @steps [
    %{img: "measure.svg", label: "Замер", content: "Бесплатный выезд нашего специалиста на Ваш объект"},
    %{img: "smeta.svg", label: "Смета", content: "Бесплатное составление сметы"},
    %{img: "contract.svg", label: "Контракт", content: "Заключим в любом удобном для Вас месте"},
    %{img: "renovation.svg", label: "Ремонт", content: "С Вас только приемка оговоренных этапов работ"},
    %{img: "renovation.svg", label: "Клининг", content: "Мы не привыкли оставлять после себя мусор"},
    %{img: "renovation.svg", label: "Сдача", content: "Приемка всего объекта"},
  ]

  @works [
    %{folder: "house_1",
      description: "",
      name: "№ комнатная квартира в Роствое",
      images: [
        "5.jpg",
        "4.jpg",
        "3.jpg",
        "2.jpg",
        "1.jpg"
      ]
    },
    %{folder: "house_2",
      description: "",
      name: "",
      images: [
        "3.jpg",
        "2.jpg",
        "1.png"
      ]
    },
    %{folder: "house_3",
      description: "",
      name: "",
      images: [
      "5.png",
      "4.jpg",
      "3.jpg",
      "2.jpg",
      "1.jpg"
    ]
    },
    %{folder: "house_4",
      description: "",
      name: "",
      images: [
        "5.jpg",
        "4.jpeg",
        "3.jpg",
        "2.jpg",
        "1.jpg"
      ]
    },
    %{folder: "house_5",
      description: "",
      name: "",
      images: [
      "7.jpg",
      "6.jpg",
      "5.jpg",
      "4.jpg",
      "3.jpg",
      "2.jpg",
      "1.jpg"
      ]
    },
    %{folder: "house_6",
      description: "",
      name: "",
      images: [
        "6.jpg",
        "5.jpg",
        "4.jpg",
        "3.jpg",
        "2.jpg",
        "1.jpg"
      ]
    },
    %{folder: "house_7",
      description: "",
      name: "",
      images: [
        "8.jpeg",
        "7.jpeg",
        "4.jpeg",
        "5.jpeg",
        "6.jpeg",
        "2.jpeg",
        "3.jpeg",
        "1.jpeg"
      ]
    },
    %{folder: "house_8",
      description: "",
      name: "",
      images: [
        "7.png",
        "6.png",
        "5.png",
        "4.png",
        "3.png",
        "2.png",
        "1.png"
      ]
    },
    %{folder: "house_9",
      description: "",
      name: "",
      images: [
        "6.jpg",
        "5.jpg",
        "4.jpg",
        "3.jpg",
        "2.jpg",
        "1.jpg"
      ]
    },
    %{folder: "house_10",
      description: "",
      name: "",
      images: [
        "7.jpg",
        "6.jpg",
        "5.jpg",
        "3.jpg",
        "4.jpg",
        "2.jpg",
        "1.jpg"
      ]
    },
    %{folder: "house_11",
      description: "",
      name: "",
      images: [
        "9.jpg",
        "8.jpg",
        "7.jpg",
        "6.jpg",
        "5.jpg",
        "4.jpg",
        "3.jpg",
        "2.jpg",
        "1.jpg"
      ]
    },
    %{folder: "house_12",
      description: "",
      name: "",
      images: [
        "11.jpg",
        "10.jpg",
        "9.jpg",
        "8.jpg",
        "7.jpg",
        "5.jpg",
        "6.jpg",
        "4.jpg",
        "3.jpg",
        "2.jpg",
        "1.jpg"
      ]
    }
  ]

  @impl true
  def mount(_params, _session, socket) do
    # changeset =
    #   %Message{}
    #   |> Feedback.change_message()
    #   |> Map.put(:action, :validate)

    socket =
      socket
      # |> assign(:step, 1)
      # |> assign(:calculator_struct, @calculator_struct)
      # |> assign(:answers, %{})
      # |> assign(:changeset, changeset)
      |> assign(:steps, @steps)
      |> assign(:current_folder, nil)
      |> assign(:images, [])
      |> assign(:slide_name, "")
      |> assign(:slide_description, "")
      {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    IO.inspect(binding())
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  def apply_action(socket, :slider, params) do
    %{
      "sl_fol" => current_folder,
      "sl_img" => images,
      "sl_name" =>  slide_name,
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
end
