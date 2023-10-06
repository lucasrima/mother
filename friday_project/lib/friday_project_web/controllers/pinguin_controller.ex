defmodule FridayProjectWeb.PinguinController do
  use FridayProjectWeb, :controller

  alias FridayProject.Weekend
  alias FridayProject.Weekend.Pinguin

  def index(conn, _params) do
    pinguins = Weekend.list_pinguins()
    render(conn, :index, pinguins: pinguins)
  end

  def new(conn, _params) do
    changeset = Weekend.change_pinguin(%Pinguin{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"pinguin" => pinguin_params}) do
    case Weekend.create_pinguin(pinguin_params) do
      {:ok, pinguin} ->
        conn
        |> put_flash(:info, "Pinguin created successfully.")
        |> redirect(to: ~p"/pinguins/#{pinguin}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    pinguin = Weekend.get_pinguin!(id)
    render(conn, :show, pinguin: pinguin)
  end

  def edit(conn, %{"id" => id}) do
    pinguin = Weekend.get_pinguin!(id)
    changeset = Weekend.change_pinguin(pinguin)
    render(conn, :edit, pinguin: pinguin, changeset: changeset)
  end

  def update(conn, %{"id" => id, "pinguin" => pinguin_params}) do
    pinguin = Weekend.get_pinguin!(id)

    case Weekend.update_pinguin(pinguin, pinguin_params) do
      {:ok, pinguin} ->
        conn
        |> put_flash(:info, "Pinguin updated successfully.")
        |> redirect(to: ~p"/pinguins/#{pinguin}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, pinguin: pinguin, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    pinguin = Weekend.get_pinguin!(id)
    {:ok, _pinguin} = Weekend.delete_pinguin(pinguin)

    conn
    |> put_flash(:info, "Pinguin deleted successfully.")
    |> redirect(to: ~p"/pinguins")
  end
end
