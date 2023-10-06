defmodule FridayProjectWeb.PnjLive.Index do
  use FridayProjectWeb, :live_view

  alias FridayProject.Fridays
  alias FridayProject.Fridays.Pnj

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :pnjs, Fridays.list_pnjs())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Pnj")
    |> assign(:pnj, Fridays.get_pnj!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Pnj")
    |> assign(:pnj, %Pnj{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Pnjs")
    |> assign(:pnj, nil)
  end

  @impl true
  def handle_info({FridayProjectWeb.PnjLive.FormComponent, {:saved, pnj}}, socket) do
    {:noreply, stream_insert(socket, :pnjs, pnj)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    pnj = Fridays.get_pnj!(id)
    {:ok, _} = Fridays.delete_pnj(pnj)

    {:noreply, stream_delete(socket, :pnjs, pnj)}
  end
end
