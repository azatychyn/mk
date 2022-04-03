defmodule MkWeb.InitAssigns do
  @moduledoc """
  Ensures common `assigns` are applied to all LiveViews attaching this hook.
  """
  import Phoenix.LiveView

  alias Mk.Accounts

  def on_mount(:default, _params, session, socket) do
    user_token = get_user_token(session)
    links = if socket.view == MkWeb.PageLive, do: true, else: false

    case user_token do
      nil ->
        socket =
          socket
          |> assign(:current_user, nil)
          |> assign(:links, links)

        {:cont, socket}

      user_token ->
        {:cont, continue(socket, user_token, links)}
    end
  end

  def on_mount(:admin, _params, session, socket) do
    user_token = get_user_token(session)
    links = if socket.view == MkWeb.PageLive, do: true, else: false

    case user_token do
      nil ->
        socket =
          socket
          |> put_flash(:error, "You're not authorized to do that!")
          |> redirect(to: "/")

        {:halt, socket}

      user_token ->
        {:cont, continue(socket, user_token, links)}
    end
  end

  defp continue(socket, user_token, links) do
    user =
      socket
      |> connected?()
      |> get_user(user_token)

    socket
    |> assign(:current_user, user)
    |> assign(:links, links)
  end

  defp get_user(true, token), do: Accounts.get_user_by_session_token(token)
  defp get_user(false, _token), do: nil

  defp get_user_token(%{"user_token" => user_token}), do: user_token
  defp get_user_token(_session), do: nil
end
