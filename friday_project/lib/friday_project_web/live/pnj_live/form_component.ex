defmodule FridayProjectWeb.PnjLive.FormComponent do
  use FridayProjectWeb, :live_component

  alias FridayProject.Fridays

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage pnj records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="pnj-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:description]} type="text" label="Description" />
        <.input field={@form[:nb_thing]} type="number" label="Nb thing" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Pnj</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{pnj: pnj} = assigns, socket) do
    changeset = Fridays.change_pnj(pnj)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"pnj" => pnj_params}, socket) do
    changeset =
      socket.assigns.pnj
      |> Fridays.change_pnj(pnj_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"pnj" => pnj_params}, socket) do
    save_pnj(socket, socket.assigns.action, pnj_params)
  end

  defp save_pnj(socket, :edit, pnj_params) do
    case Fridays.update_pnj(socket.assigns.pnj, pnj_params) do
      {:ok, pnj} ->
        notify_parent({:saved, pnj})

        {:noreply,
         socket
         |> put_flash(:info, "Pnj updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_pnj(socket, :new, pnj_params) do
    case Fridays.create_pnj(pnj_params) do
      {:ok, pnj} ->
        notify_parent({:saved, pnj})

        {:noreply,
         socket
         |> put_flash(:info, "Pnj created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
