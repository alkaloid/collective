defmodule CollectiveWeb.TourControllerTest do
  use CollectiveWeb.ConnCase

  alias Collective.Members

  @create_attrs %{date: ~D[2010-04-17], interest_id: 42, membership_id: 42, notes: "some notes", result: "some result"}
  @update_attrs %{date: ~D[2011-05-18], interest_id: 43, membership_id: 43, notes: "some updated notes", result: "some updated result"}
  @invalid_attrs %{date: nil, interest_id: nil, membership_id: nil, notes: nil, result: nil}

  def fixture(:tour) do
    {:ok, tour} = Members.create_tour(@create_attrs)
    tour
  end

  describe "index" do
    test "lists all tours", %{conn: conn} do
      conn = get conn, tour_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Tours"
    end
  end

  describe "new tour" do
    test "renders form", %{conn: conn} do
      conn = get conn, tour_path(conn, :new)
      assert html_response(conn, 200) =~ "New Tour"
    end
  end

  describe "create tour" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, tour_path(conn, :create), tour: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == tour_path(conn, :show, id)

      conn = get conn, tour_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Tour"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, tour_path(conn, :create), tour: @invalid_attrs
      assert html_response(conn, 200) =~ "New Tour"
    end
  end

  describe "edit tour" do
    setup [:create_tour]

    test "renders form for editing chosen tour", %{conn: conn, tour: tour} do
      conn = get conn, tour_path(conn, :edit, tour)
      assert html_response(conn, 200) =~ "Edit Tour"
    end
  end

  describe "update tour" do
    setup [:create_tour]

    test "redirects when data is valid", %{conn: conn, tour: tour} do
      conn = put conn, tour_path(conn, :update, tour), tour: @update_attrs
      assert redirected_to(conn) == tour_path(conn, :show, tour)

      conn = get conn, tour_path(conn, :show, tour)
      assert html_response(conn, 200) =~ "some updated notes"
    end

    test "renders errors when data is invalid", %{conn: conn, tour: tour} do
      conn = put conn, tour_path(conn, :update, tour), tour: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Tour"
    end
  end

  describe "delete tour" do
    setup [:create_tour]

    test "deletes chosen tour", %{conn: conn, tour: tour} do
      conn = delete conn, tour_path(conn, :delete, tour)
      assert redirected_to(conn) == tour_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, tour_path(conn, :show, tour)
      end
    end
  end

  defp create_tour(_) do
    tour = fixture(:tour)
    {:ok, tour: tour}
  end
end
