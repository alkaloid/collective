defmodule Collective.Members.Interest do
  use Ecto.Schema
  import Ecto.Changeset
  alias Collective.Members.Interest


  schema "interests" do
    field :company_id, :integer
    field :interest_type, :string
    field :notes, :string
    field :referrer_id, :integer
    field :source, :string

    timestamps()
  end

  @doc false
  def changeset(%Interest{} = interest, attrs) do
    interest
    |> cast(attrs, [:company_id, :interest_type, :source, :referrer_id, :notes])
    |> validate_required([:company_id, :interest_type, :source, :referrer_id, :notes])
  end
end
