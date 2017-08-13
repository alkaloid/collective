defmodule Collective.Members.Company do
  use Ecto.Schema
  import Ecto.Changeset
  alias Collective.Members.Company


  schema "companies" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Company{} = company, attrs) do
    company
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
