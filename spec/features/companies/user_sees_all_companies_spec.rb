require 'rails_helper'

describe "User sees all companies" do
  scenario "a user sees all the companies" do
    create(:company)
    create(:company, name: "ESPN")

    visit companies_path

    expect(page).to have_content("ESPN")
  end

end
