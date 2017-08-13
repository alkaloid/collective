defmodule CollectiveWeb.TourController do
  use CollectiveWeb, :controller

  alias Collective.Members
  alias Collective.Members.Tour

  def index(conn, _params) do
    tours = Members.list_tours()
    render(conn, "index.html", tours: tours)
  end

  def new(conn, _params) do
    changeset = Members.change_tour(%Tour{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"tour" => tour_params}) do
    case Members.create_tour(tour_params) do
      {:ok, tour} ->
        conn
        |> put_flash(:info, "Tour created successfully.")
        |> redirect(to: tour_path(conn, :show, tour))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    tour = Members.get_tour!(id)
    render(conn, "show.html", tour: tour)
  end

  def edit(conn, %{"id" => id}) do
    tour = Members.get_tour!(id)
    changeset = Members.change_tour(tour)
    render(conn, "edit.html", tour: tour, changeset: changeset)
  end

  def update(conn, %{"id" => id, "tour" => tour_params}) do
    tour = Members.get_tour!(id)

    case Members.update_tour(tour, tour_params) do
      {:ok, tour} ->
        conn
        |> put_flash(:info, "Tour updated successfully.")
        |> redirect(to: tour_path(conn, :show, tour))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", tour: tour, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    tour = Members.get_tour!(id)
    {:ok, _tour} = Members.delete_tour(tour)

    conn
    |> put_flash(:info, "Tour deleted successfully.")
    |> redirect(to: tour_path(conn, :index))
  end
end
