defmodule Collective.Members.Tour do
  use Ecto.Schema
  import Ecto.Changeset
  alias Collective.Members.Tour


  schema "tours" do
    field :date, :date
    field :interest_id, :integer
    field :membership_id, :integer
    field :notes, :string
    field :result, :string

    timestamps()
  end

  @doc false
  def changeset(%Tour{} = tour, attrs) do
    tour
    |> cast(attrs, [:interest_id, :date, :result, :membership_id, :notes])
    |> validate_required([:interest_id, :date, :result, :membership_id, :notes])
  end
end
