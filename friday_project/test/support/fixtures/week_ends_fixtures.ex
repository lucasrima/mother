defmodule FridayProject.WeekEndsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FridayProject.WeekEnds` context.
  """

  @doc """
  Generate a patry.
  """
  def patry_fixture(attrs \\ %{}) do
    {:ok, patry} =
      attrs
      |> Enum.into(%{
        name: "some name",
        date_party: ~N[2023-10-05 14:52:00]
      })
      |> FridayProject.WeekEnds.create_patry()

    patry
  end
end
