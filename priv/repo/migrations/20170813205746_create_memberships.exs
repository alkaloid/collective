defmodule Collective.Repo.Migrations.CreateMemberships do
  use Ecto.Migration

  def change do
    create table(:memberships) do
      add :company_id, references(:companies)
      add :start_date, :date
      add :end_date, :date
      add :created_by, references(:users)
      add :monthly_amount, :decimal
      add :notes, :text

      timestamps()
    end

  end
end
