defmodule FridayProject.WeekEndsTest do
  use FridayProject.DataCase

  alias FridayProject.WeekEnds

  describe "parties" do
    alias FridayProject.WeekEnds.Patry

    import FridayProject.WeekEndsFixtures

    @invalid_attrs %{name: nil, date_party: nil}

    test "list_parties/0 returns all parties" do
      patry = patry_fixture()
      assert WeekEnds.list_parties() == [patry]
    end

    test "get_patry!/1 returns the patry with given id" do
      patry = patry_fixture()
      assert WeekEnds.get_patry!(patry.id) == patry
    end

    test "create_patry/1 with valid data creates a patry" do
      valid_attrs = %{name: "some name", date_party: ~N[2023-10-05 14:52:00]}

      assert {:ok, %Patry{} = patry} = WeekEnds.create_patry(valid_attrs)
      assert patry.name == "some name"
      assert patry.date_party == ~N[2023-10-05 14:52:00]
    end

    test "create_patry/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = WeekEnds.create_patry(@invalid_attrs)
    end

    test "update_patry/2 with valid data updates the patry" do
      patry = patry_fixture()
      update_attrs = %{name: "some updated name", date_party: ~N[2023-10-06 14:52:00]}

      assert {:ok, %Patry{} = patry} = WeekEnds.update_patry(patry, update_attrs)
      assert patry.name == "some updated name"
      assert patry.date_party == ~N[2023-10-06 14:52:00]
    end

    test "update_patry/2 with invalid data returns error changeset" do
      patry = patry_fixture()
      assert {:error, %Ecto.Changeset{}} = WeekEnds.update_patry(patry, @invalid_attrs)
      assert patry == WeekEnds.get_patry!(patry.id)
    end

    test "delete_patry/1 deletes the patry" do
      patry = patry_fixture()
      assert {:ok, %Patry{}} = WeekEnds.delete_patry(patry)
      assert_raise Ecto.NoResultsError, fn -> WeekEnds.get_patry!(patry.id) end
    end

    test "change_patry/1 returns a patry changeset" do
      patry = patry_fixture()
      assert %Ecto.Changeset{} = WeekEnds.change_patry(patry)
    end
  end
end
