defmodule Collective.Repo.Migrations.CreateTours do
  use Ecto.Migration

  def change do
    create table(:tours) do
      add :interest_id, references(:interests)
      add :date, :date
      add :result, :string
      add :membership_id, references(:memberships)
      add :notes, :text

      timestamps()
    end

  end
end
