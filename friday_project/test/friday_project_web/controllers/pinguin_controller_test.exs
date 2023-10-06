defmodule FridayProjectWeb.PinguinControllerTest do
  use FridayProjectWeb.ConnCase

  import FridayProject.WeekendFixtures

  @create_attrs %{name: "some name", age: 42}
  @update_attrs %{name: "some updated name", age: 43}
  @invalid_attrs %{name: nil, age: nil}

  describe "index" do
    test "lists all pinguins", %{conn: conn} do
      conn = get(conn, ~p"/pinguins")
      assert html_response(conn, 200) =~ "Listing Pinguins"
    end
  end

  describe "new pinguin" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/pinguins/new")
      assert html_response(conn, 200) =~ "New Pinguin"
    end
  end

  describe "create pinguin" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/pinguins", pinguin: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/pinguins/#{id}"

      conn = get(conn, ~p"/pinguins/#{id}")
      assert html_response(conn, 200) =~ "Pinguin #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/pinguins", pinguin: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Pinguin"
    end
  end

  describe "edit pinguin" do
    setup [:create_pinguin]

    test "renders form for editing chosen pinguin", %{conn: conn, pinguin: pinguin} do
      conn = get(conn, ~p"/pinguins/#{pinguin}/edit")
      assert html_response(conn, 200) =~ "Edit Pinguin"
    end
  end

  describe "update pinguin" do
    setup [:create_pinguin]

    test "redirects when data is valid", %{conn: conn, pinguin: pinguin} do
      conn = put(conn, ~p"/pinguins/#{pinguin}", pinguin: @update_attrs)
      assert redirected_to(conn) == ~p"/pinguins/#{pinguin}"

      conn = get(conn, ~p"/pinguins/#{pinguin}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, pinguin: pinguin} do
      conn = put(conn, ~p"/pinguins/#{pinguin}", pinguin: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Pinguin"
    end
  end

  describe "delete pinguin" do
    setup [:create_pinguin]

    test "deletes chosen pinguin", %{conn: conn, pinguin: pinguin} do
      conn = delete(conn, ~p"/pinguins/#{pinguin}")
      assert redirected_to(conn) == ~p"/pinguins"

      assert_error_sent 404, fn ->
        get(conn, ~p"/pinguins/#{pinguin}")
      end
    end
  end

  defp create_pinguin(_) do
    pinguin = pinguin_fixture()
    %{pinguin: pinguin}
  end
end
