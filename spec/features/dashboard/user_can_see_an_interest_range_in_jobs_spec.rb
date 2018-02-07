require "rails_helper"

describe "As a user" do
  describe "when I visit jobs dashboard" do
    scenario "I can see an interest range of jobs" do
      category = create(:category)
      company = Company.create!(name: "Turing")
      company_2 = Company.create!(name: "Not Turing")
      Job.create!(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
      Job.create!(title: "Develope", level_of_interest: 50, city: "Denver", company: company, category: category)
      Job.create!(title: "Developr", level_of_interest: 51, city: "Denver", company: company, category: category)
      Job.create!(title: "Develoer", level_of_interest: 100, city: "Home", company: company_2, category: category)
      Job.create!(title: "Develper", level_of_interest: 101, city: "Home", company: company_2, category: category)

      visit dashboard_path

      expect(page).to have_content("Home")
      expect(page).to have_content("Denver")
      expect(page).to have_content("2")
      expect(page).to have_content("1")
    end
  end
end
