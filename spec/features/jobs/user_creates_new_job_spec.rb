require 'rails_helper'

describe "User creates a new job" do
  before(:each) do
    @category = create(:category)
    @company = create(:company)
  end
  scenario "a user can create a new job" do
    visit new_company_job_path(@company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"

    click_button "Create"

    expect(current_path).to eq("/companies/1/jobs/1")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end
end
