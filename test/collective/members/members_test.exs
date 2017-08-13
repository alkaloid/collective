defmodule Collective.MembersTest do
  use Collective.DataCase

  alias Collective.Members

  describe "companies" do
    alias Collective.Members.Company

    @valid_attrs %{created_by_id: 42, name: "some name"}
    @update_attrs %{created_by_id: 43, name: "some updated name"}
    @invalid_attrs %{created_by_id: nil, name: nil}

    def company_fixture(attrs \\ %{}) do
      {:ok, company} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Members.create_company()

      company
    end

    test "list_companies/0 returns all companies" do
      company = company_fixture()
      assert Members.list_companies() == [company]
    end

    test "get_company!/1 returns the company with given id" do
      company = company_fixture()
      assert Members.get_company!(company.id) == company
    end

    test "create_company/1 with valid data creates a company" do
      assert {:ok, %Company{} = company} = Members.create_company(@valid_attrs)
      assert company.created_by_id == 42
      assert company.name == "some name"
    end

    test "create_company/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Members.create_company(@invalid_attrs)
    end

    test "update_company/2 with valid data updates the company" do
      company = company_fixture()
      assert {:ok, company} = Members.update_company(company, @update_attrs)
      assert %Company{} = company
      assert company.created_by_id == 43
      assert company.name == "some updated name"
    end

    test "update_company/2 with invalid data returns error changeset" do
      company = company_fixture()
      assert {:error, %Ecto.Changeset{}} = Members.update_company(company, @invalid_attrs)
      assert company == Members.get_company!(company.id)
    end

    test "delete_company/1 deletes the company" do
      company = company_fixture()
      assert {:ok, %Company{}} = Members.delete_company(company)
      assert_raise Ecto.NoResultsError, fn -> Members.get_company!(company.id) end
    end

    test "change_company/1 returns a company changeset" do
      company = company_fixture()
      assert %Ecto.Changeset{} = Members.change_company(company)
    end
  end

  describe "interests" do
    alias Collective.Members.Interest

    @valid_attrs %{company_id: 42, interest_type: "some interest_type", notes: "some notes", referrer_id: 42, source: "some source"}
    @update_attrs %{company_id: 43, interest_type: "some updated interest_type", notes: "some updated notes", referrer_id: 43, source: "some updated source"}
    @invalid_attrs %{company_id: nil, interest_type: nil, notes: nil, referrer_id: nil, source: nil}

    def interest_fixture(attrs \\ %{}) do
      {:ok, interest} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Members.create_interest()

      interest
    end

    test "list_interests/0 returns all interests" do
      interest = interest_fixture()
      assert Members.list_interests() == [interest]
    end

    test "get_interest!/1 returns the interest with given id" do
      interest = interest_fixture()
      assert Members.get_interest!(interest.id) == interest
    end

    test "create_interest/1 with valid data creates a interest" do
      assert {:ok, %Interest{} = interest} = Members.create_interest(@valid_attrs)
      assert interest.company_id == 42
      assert interest.interest_type == "some interest_type"
      assert interest.notes == "some notes"
      assert interest.referrer_id == 42
      assert interest.source == "some source"
    end

    test "create_interest/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Members.create_interest(@invalid_attrs)
    end

    test "update_interest/2 with valid data updates the interest" do
      interest = interest_fixture()
      assert {:ok, interest} = Members.update_interest(interest, @update_attrs)
      assert %Interest{} = interest
      assert interest.company_id == 43
      assert interest.interest_type == "some updated interest_type"
      assert interest.notes == "some updated notes"
      assert interest.referrer_id == 43
      assert interest.source == "some updated source"
    end

    test "update_interest/2 with invalid data returns error changeset" do
      interest = interest_fixture()
      assert {:error, %Ecto.Changeset{}} = Members.update_interest(interest, @invalid_attrs)
      assert interest == Members.get_interest!(interest.id)
    end

    test "delete_interest/1 deletes the interest" do
      interest = interest_fixture()
      assert {:ok, %Interest{}} = Members.delete_interest(interest)
      assert_raise Ecto.NoResultsError, fn -> Members.get_interest!(interest.id) end
    end

    test "change_interest/1 returns a interest changeset" do
      interest = interest_fixture()
      assert %Ecto.Changeset{} = Members.change_interest(interest)
    end
  end

  describe "tours" do
    alias Collective.Members.Tour

    @valid_attrs %{date: ~D[2010-04-17], interest_id: 42, membership_id: 42, notes: "some notes", result: "some result"}
    @update_attrs %{date: ~D[2011-05-18], interest_id: 43, membership_id: 43, notes: "some updated notes", result: "some updated result"}
    @invalid_attrs %{date: nil, interest_id: nil, membership_id: nil, notes: nil, result: nil}

    def tour_fixture(attrs \\ %{}) do
      {:ok, tour} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Members.create_tour()

      tour
    end

    test "list_tours/0 returns all tours" do
      tour = tour_fixture()
      assert Members.list_tours() == [tour]
    end

    test "get_tour!/1 returns the tour with given id" do
      tour = tour_fixture()
      assert Members.get_tour!(tour.id) == tour
    end

    test "create_tour/1 with valid data creates a tour" do
      assert {:ok, %Tour{} = tour} = Members.create_tour(@valid_attrs)
      assert tour.date == ~D[2010-04-17]
      assert tour.interest_id == 42
      assert tour.membership_id == 42
      assert tour.notes == "some notes"
      assert tour.result == "some result"
    end

    test "create_tour/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Members.create_tour(@invalid_attrs)
    end

    test "update_tour/2 with valid data updates the tour" do
      tour = tour_fixture()
      assert {:ok, tour} = Members.update_tour(tour, @update_attrs)
      assert %Tour{} = tour
      assert tour.date == ~D[2011-05-18]
      assert tour.interest_id == 43
      assert tour.membership_id == 43
      assert tour.notes == "some updated notes"
      assert tour.result == "some updated result"
    end

    test "update_tour/2 with invalid data returns error changeset" do
      tour = tour_fixture()
      assert {:error, %Ecto.Changeset{}} = Members.update_tour(tour, @invalid_attrs)
      assert tour == Members.get_tour!(tour.id)
    end

    test "delete_tour/1 deletes the tour" do
      tour = tour_fixture()
      assert {:ok, %Tour{}} = Members.delete_tour(tour)
      assert_raise Ecto.NoResultsError, fn -> Members.get_tour!(tour.id) end
    end

    test "change_tour/1 returns a tour changeset" do
      tour = tour_fixture()
      assert %Ecto.Changeset{} = Members.change_tour(tour)
    end
  end

  describe "memberships" do
    alias Collective.Members.Membership

    @valid_attrs %{company_id: 42, created_by: 42, end_date: ~D[2010-04-17], monthly_amount: "120.5", notes: "some notes", start_date: ~D[2010-04-17]}
    @update_attrs %{company_id: 43, created_by: 43, end_date: ~D[2011-05-18], monthly_amount: "456.7", notes: "some updated notes", start_date: ~D[2011-05-18]}
    @invalid_attrs %{company_id: nil, created_by: nil, end_date: nil, monthly_amount: nil, notes: nil, start_date: nil}

    def membership_fixture(attrs \\ %{}) do
      {:ok, membership} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Members.create_membership()

      membership
    end

    test "list_memberships/0 returns all memberships" do
      membership = membership_fixture()
      assert Members.list_memberships() == [membership]
    end

    test "get_membership!/1 returns the membership with given id" do
      membership = membership_fixture()
      assert Members.get_membership!(membership.id) == membership
    end

    test "create_membership/1 with valid data creates a membership" do
      assert {:ok, %Membership{} = membership} = Members.create_membership(@valid_attrs)
      assert membership.company_id == 42
      assert membership.created_by == 42
      assert membership.end_date == ~D[2010-04-17]
      assert membership.monthly_amount == Decimal.new("120.5")
      assert membership.notes == "some notes"
      assert membership.start_date == ~D[2010-04-17]
    end

    test "create_membership/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Members.create_membership(@invalid_attrs)
    end

    test "update_membership/2 with valid data updates the membership" do
      membership = membership_fixture()
      assert {:ok, membership} = Members.update_membership(membership, @update_attrs)
      assert %Membership{} = membership
      assert membership.company_id == 43
      assert membership.created_by == 43
      assert membership.end_date == ~D[2011-05-18]
      assert membership.monthly_amount == Decimal.new("456.7")
      assert membership.notes == "some updated notes"
      assert membership.start_date == ~D[2011-05-18]
    end

    test "update_membership/2 with invalid data returns error changeset" do
      membership = membership_fixture()
      assert {:error, %Ecto.Changeset{}} = Members.update_membership(membership, @invalid_attrs)
      assert membership == Members.get_membership!(membership.id)
    end

    test "delete_membership/1 deletes the membership" do
      membership = membership_fixture()
      assert {:ok, %Membership{}} = Members.delete_membership(membership)
      assert_raise Ecto.NoResultsError, fn -> Members.get_membership!(membership.id) end
    end

    test "change_membership/1 returns a membership changeset" do
      membership = membership_fixture()
      assert %Ecto.Changeset{} = Members.change_membership(membership)
    end
  end
end
