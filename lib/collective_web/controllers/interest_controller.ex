defmodule CollectiveWeb.InterestController do
  use CollectiveWeb, :controller

  alias Collective.Members
  alias Collective.Members.Interest

  def index(conn, _params) do
    interests = Members.list_interests()
    render(conn, "index.html", interests: interests)
  end

  def new(conn, _params) do
    form = create_form(CollectiveWeb.InterestType, %Interest{})
    render(conn, "form.html", form: form)
  end

  def create(conn, %{"interest" => interest_params}) do
    CollectiveWeb.InterestType
    |> create_form(%Interest{}, interest_params)
    |> insert_form_data
    |> case do
      {:ok, interest} ->
        conn
        |> put_flash(:info, "Interest created successfully.")
        |> redirect(to: interest_path(conn, :show, interest))
      {:error, form} ->
        # display errors
        render(conn, "form.html", form: form)
    end
  end

  def show(conn, %{"id" => id}) do
    interest = Members.get_interest!(id)
    render(conn, "show.html", interest: interest)
  end

  def edit(conn, %{"id" => id}) do
    interest = Members.get_interest!(id)
    form = create_form(CollectiveWeb.InterestType, interest)
    render(conn, "edit.html", interest: interest, form: form)
  end

  def update(conn, %{"id" => id, "interest" => interest_params}) do
    interest = Members.get_interest!(id)

    CollectiveWeb.InterestType
    |> create_form(interest, interest_params)
    |> update_form_data
    |> case do
      {:ok, interest} ->
        conn
        |> put_flash(:info, "Interest updated successfully.")
        |> redirect(to: interest_path(conn, :show, interest))
      {:error, form} ->
        render(conn, "edit.html", interest: interest, form: form)
    end
  end

  def delete(conn, %{"id" => id}) do
    interest = Members.get_interest!(id)
    {:ok, _interest} = Members.delete_interest(interest)

    conn
    |> put_flash(:info, "Interest deleted successfully.")
    |> redirect(to: interest_path(conn, :index))
  end
end
