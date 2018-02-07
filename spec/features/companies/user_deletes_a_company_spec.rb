require 'rails_helper'

describe "User deletes existing company" do
  scenario "a user can delete a company" do
    company = create(:company)
    visit companies_path

    within(".company_#{company.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("Opakawagalaga was successfully deleted!")
  end
end
