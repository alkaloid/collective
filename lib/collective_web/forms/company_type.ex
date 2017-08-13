defmodule CollectiveWeb.CompanyType do
  use Formex.Type
  use Formex.Ecto.Type

  def build_form(form) do
    form
    |> add(:name, :text_input, label: "Name", validation: [presence: true])
    |> add(:save, :submit, label: "Submit", phoenix_opts: [
      class: "btn-primary"
    ])
  end
end
