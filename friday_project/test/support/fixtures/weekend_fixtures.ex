defmodule FridayProject.WeekendFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FridayProject.Weekend` context.
  """

  @doc """
  Generate a pinguin.
  """
  def pinguin_fixture(attrs \\ %{}) do
    {:ok, pinguin} =
      attrs
      |> Enum.into(%{
        name: "some name",
        age: 42
      })
      |> FridayProject.Weekend.create_pinguin()

    pinguin
  end
end
