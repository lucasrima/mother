defmodule FridayProject.Fridays do
  @moduledoc """
  The Fridays context.
  """

  import Ecto.Query, warn: false
  alias FridayProject.Repo

  alias FridayProject.Fridays.FirstDevExperience

  @doc """
  Returns the list of first_dev_experiences.

  ## Examples

      iex> list_first_dev_experiences()
      [%FirstDevExperience{}, ...]

  """
  def list_first_dev_experiences do
    Repo.all(FirstDevExperience)
  end

  @doc """
  Gets a single first_dev_experience.

  Raises `Ecto.NoResultsError` if the First dev experience does not exist.

  ## Examples

      iex> get_first_dev_experience!(123)
      %FirstDevExperience{}

      iex> get_first_dev_experience!(456)
      ** (Ecto.NoResultsError)

  """
  def get_first_dev_experience!(id), do: Repo.get!(FirstDevExperience, id)

  @doc """
  Creates a first_dev_experience.

  ## Examples

      iex> create_first_dev_experience(%{field: value})
      {:ok, %FirstDevExperience{}}

      iex> create_first_dev_experience(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_first_dev_experience(attrs \\ %{}) do
    %FirstDevExperience{}
    |> FirstDevExperience.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a first_dev_experience.

  ## Examples

      iex> update_first_dev_experience(first_dev_experience, %{field: new_value})
      {:ok, %FirstDevExperience{}}

      iex> update_first_dev_experience(first_dev_experience, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_first_dev_experience(%FirstDevExperience{} = first_dev_experience, attrs) do
    first_dev_experience
    |> FirstDevExperience.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a first_dev_experience.

  ## Examples

      iex> delete_first_dev_experience(first_dev_experience)
      {:ok, %FirstDevExperience{}}

      iex> delete_first_dev_experience(first_dev_experience)
      {:error, %Ecto.Changeset{}}

  """
  def delete_first_dev_experience(%FirstDevExperience{} = first_dev_experience) do
    Repo.delete(first_dev_experience)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking first_dev_experience changes.

  ## Examples

      iex> change_first_dev_experience(first_dev_experience)
      %Ecto.Changeset{data: %FirstDevExperience{}}

  """
  def change_first_dev_experience(%FirstDevExperience{} = first_dev_experience, attrs \\ %{}) do
    FirstDevExperience.changeset(first_dev_experience, attrs)
  end
end
