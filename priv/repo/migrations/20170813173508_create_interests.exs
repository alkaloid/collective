defmodule Collective.Repo.Migrations.CreateInterests do
  use Ecto.Migration

  def change do
    create table(:interests) do
      add :company_id, references(:companies)
      add :interest_type, :string
      add :source, :string
      add :referrer_id, references(:companies)
      add :notes, :text

      timestamps()
    end

  end
end
