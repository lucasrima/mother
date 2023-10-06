defmodule FridayProject.WeekEnds do
  @moduledoc """
  The WeekEnds context.
  """

  import Ecto.Query, warn: false
  alias FridayProject.Repo

  alias FridayProject.WeekEnds.Patry

  @doc """
  Returns the list of parties.

  ## Examples

      iex> list_parties()
      [%Patry{}, ...]

  """
  def list_parties do
    Repo.all(Patry)
  end

  @doc """
  Gets a single patry.

  Raises `Ecto.NoResultsError` if the Patry does not exist.

  ## Examples

      iex> get_patry!(123)
      %Patry{}

      iex> get_patry!(456)
      ** (Ecto.NoResultsError)

  """
  def get_patry!(id), do: Repo.get!(Patry, id)

  @doc """
  Creates a patry.

  ## Examples

      iex> create_patry(%{field: value})
      {:ok, %Patry{}}

      iex> create_patry(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_patry(attrs \\ %{}) do
    %Patry{}
    |> Patry.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a patry.

  ## Examples

      iex> update_patry(patry, %{field: new_value})
      {:ok, %Patry{}}

      iex> update_patry(patry, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_patry(%Patry{} = patry, attrs) do
    patry
    |> Patry.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a patry.

  ## Examples

      iex> delete_patry(patry)
      {:ok, %Patry{}}

      iex> delete_patry(patry)
      {:error, %Ecto.Changeset{}}

  """
  def delete_patry(%Patry{} = patry) do
    Repo.delete(patry)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking patry changes.

  ## Examples

      iex> change_patry(patry)
      %Ecto.Changeset{data: %Patry{}}

  """
  def change_patry(%Patry{} = patry, attrs \\ %{}) do
    Patry.changeset(patry, attrs)
  end
end
