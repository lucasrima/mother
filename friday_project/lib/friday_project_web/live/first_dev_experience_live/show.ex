defmodule FridayProjectWeb.FirstDevExperienceLive.Show do
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
     |> assign(:first_dev_experience, Fridays.get_first_dev_experience!(id))}
  end

  defp page_title(:show), do: "Show First dev experience"
  defp page_title(:edit), do: "Edit First dev experience"
end
