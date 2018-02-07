require 'rails_helper'

describe "User creates a new contact" do
  scenario "a user can create a new contact" do
    company = create(:company)
    visit company_path(company)

    fill_in "contact[name]", with: "I don't work here"
    fill_in "contact[position]", with: "I don't even wor..."
    fill_in "contact[email]", with: "I'm not giving that to you!"
    save_and_open_page
    click_button "Create Contact"

    expect(current_path).to eq("/companies/1/jobs")
    expect(page).to have_content("Opakawagalaga")
    expect(page).to have_content("I don't work here")
  end
end
