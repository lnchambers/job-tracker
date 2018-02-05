require "rails_helper"

describe "As a User" do
  describe "when I visit /jobs/:id/edit" do
    scenario "I can edit a specific job" do
      company = Company.create!(name: "Opakawagalaga")
      job = Job.create!(title: "Work For Free", level_of_interest: 100, city: "Home", company_id: company.id)

      visit edit_company_job_path(job)

      fill_in "job[name]", with: "Work For Money"
      fill_in "job[level_of_interest]", with: 50
      fill_in "job[city]", with: "Neverland"
      click_on "Edit Job"

      expect(page).to_not have_content "Work For Free"
      expect(page).to_not have_content "100"
      expect(page).to_not have_content "Home"
      expect(page).to have_content "Work For Money"
      expect(page).to have_content "50"
      expect(page).to have_content "Neverland"
    end
  end
end
