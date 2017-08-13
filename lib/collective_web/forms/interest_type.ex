defmodule CollectiveWeb.InterestType do
  use Formex.Type
  use Formex.Ecto.Type

  alias Formex.Ecto.CustomField.SelectAssoc

  def build_form(form) do
    form
    #|> add(:company_id, SelectAssoc, label: "Company", phoenix_opts: [
    #  prompt: "Choose company"
    #])
    |> add(:company_info, CollectiveWeb.CompanyType, struct_module: CollectiveWeb.Company)
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
