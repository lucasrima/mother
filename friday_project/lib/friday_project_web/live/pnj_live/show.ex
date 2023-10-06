defmodule FridayProjectWeb.PnjLive.Show do
  use FridayProjectWeb, :live_view

  alias FridayProject.Fridays

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:pnj, Fridays.get_pnj!(id))}
  end

  defp page_title(:show), do: "Show Pnj"
  defp page_title(:edit), do: "Edit Pnj"
end
