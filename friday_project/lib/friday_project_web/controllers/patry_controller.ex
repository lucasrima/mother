defmodule FridayProjectWeb.PatryController do
  use FridayProjectWeb, :controller

  alias FridayProject.WeekEnds
  alias FridayProject.WeekEnds.Patry

  def index(conn, _params) do
    parties = WeekEnds.list_parties()
    render(conn, :index, parties: parties)
  end

  def new(conn, _params) do
    changeset = WeekEnds.change_patry(%Patry{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"patry" => patry_params}) do
    case WeekEnds.create_patry(patry_params) do
      {:ok, patry} ->
        conn
        |> put_flash(:info, "Patry created successfully.")
        |> redirect(to: ~p"/parties/#{patry}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    patry = WeekEnds.get_patry!(id)
    render(conn, :show, patry: patry)
  end

  def edit(conn, %{"id" => id}) do
    patry = WeekEnds.get_patry!(id)
    changeset = WeekEnds.change_patry(patry)
    render(conn, :edit, patry: patry, changeset: changeset)
  end

  def update(conn, %{"id" => id, "patry" => patry_params}) do
    patry = WeekEnds.get_patry!(id)

    case WeekEnds.update_patry(patry, patry_params) do
      {:ok, patry} ->
        conn
        |> put_flash(:info, "Patry updated successfully.")
        |> redirect(to: ~p"/parties/#{patry}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, patry: patry, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    patry = WeekEnds.get_patry!(id)
    {:ok, _patry} = WeekEnds.delete_patry(patry)

    conn
    |> put_flash(:info, "Patry deleted successfully.")
    |> redirect(to: ~p"/parties")
  end
end
