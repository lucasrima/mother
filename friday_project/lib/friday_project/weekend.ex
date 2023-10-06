defmodule FridayProject.Weekend do
  @moduledoc """
  The Weekend context.
  """

  import Ecto.Query, warn: false
  alias FridayProject.Repo

  alias FridayProject.Weekend.Pinguin

  @doc """
  Returns the list of pinguins.

  ## Examples

      iex> list_pinguins()
      [%Pinguin{}, ...]

  """
  def list_pinguins do
    Repo.all(Pinguin)
  end

  @doc """
  Gets a single pinguin.

  Raises `Ecto.NoResultsError` if the Pinguin does not exist.

  ## Examples

      iex> get_pinguin!(123)
      %Pinguin{}

      iex> get_pinguin!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pinguin!(id), do: Repo.get!(Pinguin, id)

  @doc """
  Creates a pinguin.

  ## Examples

      iex> create_pinguin(%{field: value})
      {:ok, %Pinguin{}}

      iex> create_pinguin(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pinguin(attrs \\ %{}) do
    %Pinguin{}
    |> Pinguin.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pinguin.

  ## Examples

      iex> update_pinguin(pinguin, %{field: new_value})
      {:ok, %Pinguin{}}

      iex> update_pinguin(pinguin, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pinguin(%Pinguin{} = pinguin, attrs) do
    pinguin
    |> Pinguin.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pinguin.

  ## Examples

      iex> delete_pinguin(pinguin)
      {:ok, %Pinguin{}}

      iex> delete_pinguin(pinguin)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pinguin(%Pinguin{} = pinguin) do
    Repo.delete(pinguin)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pinguin changes.

  ## Examples

      iex> change_pinguin(pinguin)
      %Ecto.Changeset{data: %Pinguin{}}

  """
  def change_pinguin(%Pinguin{} = pinguin, attrs \\ %{}) do
    Pinguin.changeset(pinguin, attrs)
  end
end
