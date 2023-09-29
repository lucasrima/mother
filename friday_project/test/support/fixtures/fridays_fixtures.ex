defmodule FridayProject.FridaysFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FridayProject.Fridays` context.
  """

  @doc """
  Generate a first_dev_experience.
  """
  def first_dev_experience_fixture(attrs \\ %{}) do
    {:ok, first_dev_experience} =
      attrs
      |> Enum.into(%{
        name: "some name",
        description: "some description",
        nb_thing: 42
      })
      |> FridayProject.Fridays.create_first_dev_experience()

    first_dev_experience
  end
end
