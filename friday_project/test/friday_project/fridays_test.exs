defmodule FridayProject.FridaysTest do
  use FridayProject.DataCase

  alias FridayProject.Fridays

  describe "first_dev_experiences" do
    alias FridayProject.Fridays.FirstDevExperience

    import FridayProject.FridaysFixtures

    @invalid_attrs %{name: nil, description: nil, nb_thing: nil}

    test "list_first_dev_experiences/0 returns all first_dev_experiences" do
      first_dev_experience = first_dev_experience_fixture()
      assert Fridays.list_first_dev_experiences() == [first_dev_experience]
    end

    test "get_first_dev_experience!/1 returns the first_dev_experience with given id" do
      first_dev_experience = first_dev_experience_fixture()
      assert Fridays.get_first_dev_experience!(first_dev_experience.id) == first_dev_experience
    end

    test "create_first_dev_experience/1 with valid data creates a first_dev_experience" do
      valid_attrs = %{name: "some name", description: "some description", nb_thing: 42}

      assert {:ok, %FirstDevExperience{} = first_dev_experience} = Fridays.create_first_dev_experience(valid_attrs)
      assert first_dev_experience.name == "some name"
      assert first_dev_experience.description == "some description"
      assert first_dev_experience.nb_thing == 42
    end

    test "create_first_dev_experience/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Fridays.create_first_dev_experience(@invalid_attrs)
    end

    test "update_first_dev_experience/2 with valid data updates the first_dev_experience" do
      first_dev_experience = first_dev_experience_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", nb_thing: 43}

      assert {:ok, %FirstDevExperience{} = first_dev_experience} = Fridays.update_first_dev_experience(first_dev_experience, update_attrs)
      assert first_dev_experience.name == "some updated name"
      assert first_dev_experience.description == "some updated description"
      assert first_dev_experience.nb_thing == 43
    end

    test "update_first_dev_experience/2 with invalid data returns error changeset" do
      first_dev_experience = first_dev_experience_fixture()
      assert {:error, %Ecto.Changeset{}} = Fridays.update_first_dev_experience(first_dev_experience, @invalid_attrs)
      assert first_dev_experience == Fridays.get_first_dev_experience!(first_dev_experience.id)
    end

    test "delete_first_dev_experience/1 deletes the first_dev_experience" do
      first_dev_experience = first_dev_experience_fixture()
      assert {:ok, %FirstDevExperience{}} = Fridays.delete_first_dev_experience(first_dev_experience)
      assert_raise Ecto.NoResultsError, fn -> Fridays.get_first_dev_experience!(first_dev_experience.id) end
    end

    test "change_first_dev_experience/1 returns a first_dev_experience changeset" do
      first_dev_experience = first_dev_experience_fixture()
      assert %Ecto.Changeset{} = Fridays.change_first_dev_experience(first_dev_experience)
    end
  end

  describe "pnjs" do
    alias FridayProject.Fridays.Pnj

    import FridayProject.FridaysFixtures

    @invalid_attrs %{name: nil, description: nil, nb_thing: nil}

    test "list_pnjs/0 returns all pnjs" do
      pnj = pnj_fixture()
      assert Fridays.list_pnjs() == [pnj]
    end

    test "get_pnj!/1 returns the pnj with given id" do
      pnj = pnj_fixture()
      assert Fridays.get_pnj!(pnj.id) == pnj
    end

    test "create_pnj/1 with valid data creates a pnj" do
      valid_attrs = %{name: "some name", description: "some description", nb_thing: 42}

      assert {:ok, %Pnj{} = pnj} = Fridays.create_pnj(valid_attrs)
      assert pnj.name == "some name"
      assert pnj.description == "some description"
      assert pnj.nb_thing == 42
    end

    test "create_pnj/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Fridays.create_pnj(@invalid_attrs)
    end

    test "update_pnj/2 with valid data updates the pnj" do
      pnj = pnj_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", nb_thing: 43}

      assert {:ok, %Pnj{} = pnj} = Fridays.update_pnj(pnj, update_attrs)
      assert pnj.name == "some updated name"
      assert pnj.description == "some updated description"
      assert pnj.nb_thing == 43
    end

    test "update_pnj/2 with invalid data returns error changeset" do
      pnj = pnj_fixture()
      assert {:error, %Ecto.Changeset{}} = Fridays.update_pnj(pnj, @invalid_attrs)
      assert pnj == Fridays.get_pnj!(pnj.id)
    end

    test "delete_pnj/1 deletes the pnj" do
      pnj = pnj_fixture()
      assert {:ok, %Pnj{}} = Fridays.delete_pnj(pnj)
      assert_raise Ecto.NoResultsError, fn -> Fridays.get_pnj!(pnj.id) end
    end

    test "change_pnj/1 returns a pnj changeset" do
      pnj = pnj_fixture()
      assert %Ecto.Changeset{} = Fridays.change_pnj(pnj)
    end
  end
end
