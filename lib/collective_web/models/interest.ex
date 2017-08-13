defmodule CollectiveWeb.Interest do
  alias Collective.Members.Company
  defstruct [:interest_type, :source, :notes, company_info: %Company{}]
end
