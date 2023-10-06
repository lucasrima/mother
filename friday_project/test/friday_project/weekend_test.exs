defmodule FridayProject.WeekendTest do
  use FridayProject.DataCase

  alias FridayProject.Weekend

  describe "pinguins" do
    alias FridayProject.Weekend.Pinguin

    import FridayProject.WeekendFixtures

    @invalid_attrs %{name: nil, age: nil}

    test "list_pinguins/0 returns all pinguins" do
      pinguin = pinguin_fixture()
      assert Weekend.list_pinguins() == [pinguin]
    end

    test "get_pinguin!/1 returns the pinguin with given id" do
      pinguin = pinguin_fixture()
      assert Weekend.get_pinguin!(pinguin.id) == pinguin
    end

    test "create_pinguin/1 with valid data creates a pinguin" do
      valid_attrs = %{name: "some name", age: 42}

      assert {:ok, %Pinguin{} = pinguin} = Weekend.create_pinguin(valid_attrs)
      assert pinguin.name == "some name"
      assert pinguin.age == 42
    end

    test "create_pinguin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Weekend.create_pinguin(@invalid_attrs)
    end

    test "update_pinguin/2 with valid data updates the pinguin" do
      pinguin = pinguin_fixture()
      update_attrs = %{name: "some updated name", age: 43}

      assert {:ok, %Pinguin{} = pinguin} = Weekend.update_pinguin(pinguin, update_attrs)
      assert pinguin.name == "some updated name"
      assert pinguin.age == 43
    end

    test "update_pinguin/2 with invalid data returns error changeset" do
      pinguin = pinguin_fixture()
      assert {:error, %Ecto.Changeset{}} = Weekend.update_pinguin(pinguin, @invalid_attrs)
      assert pinguin == Weekend.get_pinguin!(pinguin.id)
    end

    test "delete_pinguin/1 deletes the pinguin" do
      pinguin = pinguin_fixture()
      assert {:ok, %Pinguin{}} = Weekend.delete_pinguin(pinguin)
      assert_raise Ecto.NoResultsError, fn -> Weekend.get_pinguin!(pinguin.id) end
    end

    test "change_pinguin/1 returns a pinguin changeset" do
      pinguin = pinguin_fixture()
      assert %Ecto.Changeset{} = Weekend.change_pinguin(pinguin)
    end
  end
end
