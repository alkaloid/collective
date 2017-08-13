defmodule CollectiveWeb.MembershipController do
  use CollectiveWeb, :controller

  alias Collective.Members
  alias Collective.Members.Membership

  def index(conn, _params) do
    memberships = Members.list_memberships()
    render(conn, "index.html", memberships: memberships)
  end

  def new(conn, _params) do
    changeset = Members.change_membership(%Membership{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"membership" => membership_params}) do
    case Members.create_membership(membership_params) do
      {:ok, membership} ->
        conn
        |> put_flash(:info, "Membership created successfully.")
        |> redirect(to: membership_path(conn, :show, membership))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    membership = Members.get_membership!(id)
    render(conn, "show.html", membership: membership)
  end

  def edit(conn, %{"id" => id}) do
    membership = Members.get_membership!(id)
    changeset = Members.change_membership(membership)
    render(conn, "edit.html", membership: membership, changeset: changeset)
  end

  def update(conn, %{"id" => id, "membership" => membership_params}) do
    membership = Members.get_membership!(id)

    case Members.update_membership(membership, membership_params) do
      {:ok, membership} ->
        conn
        |> put_flash(:info, "Membership updated successfully.")
        |> redirect(to: membership_path(conn, :show, membership))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", membership: membership, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    membership = Members.get_membership!(id)
    {:ok, _membership} = Members.delete_membership(membership)

    conn
    |> put_flash(:info, "Membership deleted successfully.")
    |> redirect(to: membership_path(conn, :index))
  end
end
