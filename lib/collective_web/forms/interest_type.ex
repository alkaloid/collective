defmodule CollectiveWeb.InterestType do
  use Formex.Type
  use Formex.Ecto.Type

  def build_form(form) do
    form
    |> add(:interest_type, :text_input, label: "Interest Type", validation: [presence: true])
    |> add(:source, :text_input, label: "Source", validation: [presence: true])
    |> add(:notes, :textarea, label: "Notes", phoenix_opts: [
      rows: 4
    ])
    |> add(:save, :submit, label: "Submit", phoenix_opts: [
      class: "btn-primary"
    ])
  end
end
