require "rails_helper"

describe "As a user" do
  describe "when I visit jobs dashboard" do
    scenario "I can see a count of jobs by city" do
      create(:job)
      create(:job)
      create(:job)
      create(:job, city: "Denver")
      create(:job, city: "Denver")

      visit dashboard_path

      expect(page).to have_content("Home")
      expect(page).to have_content("Denver")
      expect(page).to have_content("2")
      expect(page).to have_content("3")
    end
  end
end
