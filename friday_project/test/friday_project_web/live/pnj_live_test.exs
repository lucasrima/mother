defmodule FridayProjectWeb.PnjLiveTest do
  use FridayProjectWeb.ConnCase

  import Phoenix.LiveViewTest
  import FridayProject.FridaysFixtures

  @create_attrs %{name: "some name", description: "some description", nb_thing: 42}
  @update_attrs %{name: "some updated name", description: "some updated description", nb_thing: 43}
  @invalid_attrs %{name: nil, description: nil, nb_thing: nil}

  defp create_pnj(_) do
    pnj = pnj_fixture()
    %{pnj: pnj}
  end

  describe "Index" do
    setup [:create_pnj]

    test "lists all pnjs", %{conn: conn, pnj: pnj} do
      {:ok, _index_live, html} = live(conn, ~p"/pnjs")

      assert html =~ "Listing Pnjs"
      assert html =~ pnj.name
    end

    test "saves new pnj", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/pnjs")

      assert index_live |> element("a", "New Pnj") |> render_click() =~
               "New Pnj"

      assert_patch(index_live, ~p"/pnjs/new")

      assert index_live
             |> form("#pnj-form", pnj: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#pnj-form", pnj: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/pnjs")

      html = render(index_live)
      assert html =~ "Pnj created successfully"
      assert html =~ "some name"
    end

    test "updates pnj in listing", %{conn: conn, pnj: pnj} do
      {:ok, index_live, _html} = live(conn, ~p"/pnjs")

      assert index_live |> element("#pnjs-#{pnj.id} a", "Edit") |> render_click() =~
               "Edit Pnj"

      assert_patch(index_live, ~p"/pnjs/#{pnj}/edit")

      assert index_live
             |> form("#pnj-form", pnj: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#pnj-form", pnj: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/pnjs")

      html = render(index_live)
      assert html =~ "Pnj updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes pnj in listing", %{conn: conn, pnj: pnj} do
      {:ok, index_live, _html} = live(conn, ~p"/pnjs")

      assert index_live |> element("#pnjs-#{pnj.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#pnjs-#{pnj.id}")
    end
  end

  describe "Show" do
    setup [:create_pnj]

    test "displays pnj", %{conn: conn, pnj: pnj} do
      {:ok, _show_live, html} = live(conn, ~p"/pnjs/#{pnj}")

      assert html =~ "Show Pnj"
      assert html =~ pnj.name
    end

    test "updates pnj within modal", %{conn: conn, pnj: pnj} do
      {:ok, show_live, _html} = live(conn, ~p"/pnjs/#{pnj}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Pnj"

      assert_patch(show_live, ~p"/pnjs/#{pnj}/show/edit")

      assert show_live
             |> form("#pnj-form", pnj: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#pnj-form", pnj: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/pnjs/#{pnj}")

      html = render(show_live)
      assert html =~ "Pnj updated successfully"
      assert html =~ "some updated name"
    end
  end
end
