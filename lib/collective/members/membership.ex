defmodule Collective.Members.Membership do
  use Ecto.Schema
  import Ecto.Changeset
  alias Collective.Members.Membership


  schema "memberships" do
    field :company_id, :integer
    field :created_by, :integer
    field :end_date, :date
    field :monthly_amount, :decimal
    field :notes, :string
    field :start_date, :date

    timestamps()
  end

  @doc false
  def changeset(%Membership{} = membership, attrs) do
    membership
    |> cast(attrs, [:company_id, :start_date, :end_date, :created_by, :monthly_amount, :notes])
    |> validate_required([:company_id, :start_date, :end_date, :created_by, :monthly_amount, :notes])
  end
end
