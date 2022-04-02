defmodule MkWeb.CategoryLive.FormComponent do
  use MkWeb, :live_component

  alias Mk.Categories

  @impl true
  def update(%{category: category} = assigns, socket) do
    changeset = Categories.change_category(category)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"category" => category_params}, socket) do
    category_params =
      category_params
      |> Enum.map(fn {k, v} -> {String.to_existing_atom(k), v} end)
      |> Map.new()
      |> Map.put_new(:description, [])
      |> Map.put_new(:peculiarity, [])

    category_params = Map.merge(socket.assigns.changeset.changes, category_params)

    changeset =
      socket.assigns.category
      |> Categories.change_category(category_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"category" => category_params}, socket) do
    category_params =
      category_params
      |> Enum.map(fn {k, v} -> {String.to_existing_atom(k), v} end)
      |> Map.new()
      |> Map.put_new(:description, [])
      |> Map.put_new(:peculiarity, [])

    category_params = Map.merge(socket.assigns.changeset.changes, category_params)
    save_category(socket, socket.assigns.action, category_params)
  end

  def handle_event("add_description", _, socket) do
    description = fetch_field(socket.assigns.changeset, :description) ++ [""]
    params = Map.merge(socket.assigns.changeset.changes, %{description: description})

    changeset =
      socket.assigns.category
      |> Categories.change_category(params)
      |> Map.put(:action, :update)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("add_peculiarity", _, socket) do
    peculiarity = fetch_field(socket.assigns.changeset, :peculiarity) ++ [""]
    params = Map.merge(socket.assigns.changeset.changes, %{peculiarity: peculiarity})

    changeset =
      socket.assigns.category
      |> Categories.change_category(params)
      |> Map.put(:action, :update)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("remove_description", %{"index" => index}, socket) do
    {index, _} = Integer.parse(index)

    new_description =
      socket.assigns.changeset
      |> fetch_field(:description)
      |> List.delete_at(index)

    params = Map.merge(socket.assigns.changeset.changes, %{description: new_description})

    changeset =
      socket.assigns.category
      |> Categories.change_category(params)
      |> Map.put(:action, :update)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("remove_peculiarity", %{"index" => index}, socket) do
    {index, _} = Integer.parse(index)

    new_peculiarity =
      socket.assigns.changeset
      |> fetch_field(:peculiarity)
      |> List.delete_at(index)

    params = Map.merge(socket.assigns.changeset.changes, %{peculiarity: new_peculiarity})

    changeset =
      socket.assigns.category
      |> Categories.change_category(params)
      |> Map.put(:action, :update)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  defp save_category(socket, :edit, category_params) do
    case Categories.update_category(socket.assigns.category, category_params) do
      {:ok, _category} ->
        {:noreply,
         socket
         |> put_flash(:info, "Category updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_category(socket, :new, category_params) do
    case Categories.create_category(category_params) do
      {:ok, _category} ->
        {:noreply,
         socket
         |> put_flash(:info, "Category created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  defp fetch_field(changeset, field) do
    case Ecto.Changeset.fetch_field(changeset, field) do
      {_source, field} ->
        field

      :error ->
        []
    end
  end
end
