defmodule FridayProjectWeb.PatryControllerTest do
  use FridayProjectWeb.ConnCase

  import FridayProject.WeekEndsFixtures

  @create_attrs %{name: "some name", date_party: ~N[2023-10-05 14:52:00]}
  @update_attrs %{name: "some updated name", date_party: ~N[2023-10-06 14:52:00]}
  @invalid_attrs %{name: nil, date_party: nil}

  describe "index" do
    test "lists all parties", %{conn: conn} do
      conn = get(conn, ~p"/parties")
      assert html_response(conn, 200) =~ "Listing Parties"
    end
  end

  describe "new patry" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/parties/new")
      assert html_response(conn, 200) =~ "New Patry"
    end
  end

  describe "create patry" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/parties", patry: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/parties/#{id}"

      conn = get(conn, ~p"/parties/#{id}")
      assert html_response(conn, 200) =~ "Patry #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/parties", patry: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Patry"
    end
  end

  describe "edit patry" do
    setup [:create_patry]

    test "renders form for editing chosen patry", %{conn: conn, patry: patry} do
      conn = get(conn, ~p"/parties/#{patry}/edit")
      assert html_response(conn, 200) =~ "Edit Patry"
    end
  end

  describe "update patry" do
    setup [:create_patry]

    test "redirects when data is valid", %{conn: conn, patry: patry} do
      conn = put(conn, ~p"/parties/#{patry}", patry: @update_attrs)
      assert redirected_to(conn) == ~p"/parties/#{patry}"

      conn = get(conn, ~p"/parties/#{patry}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, patry: patry} do
      conn = put(conn, ~p"/parties/#{patry}", patry: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Patry"
    end
  end

  describe "delete patry" do
    setup [:create_patry]

    test "deletes chosen patry", %{conn: conn, patry: patry} do
      conn = delete(conn, ~p"/parties/#{patry}")
      assert redirected_to(conn) == ~p"/parties"

      assert_error_sent 404, fn ->
        get(conn, ~p"/parties/#{patry}")
      end
    end
  end

  defp create_patry(_) do
    patry = patry_fixture()
    %{patry: patry}
  end
end
