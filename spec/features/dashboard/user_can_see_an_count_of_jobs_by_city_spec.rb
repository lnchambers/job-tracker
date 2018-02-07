require "rails_helper"

describe "As a user" do
  describe "when I visit jobs dashboard" do
    scenario "I can see a count of jobs by city" do
      category = create(:category)
      company = Company.create!(name: "Turing")
      company_2 = Company.create!(name: "Not Turing")
      job = Job.create!(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
      job = Job.create!(title: "Develope", level_of_interest: 40, city: "Denver", company: company, category: category)
      job = Job.create!(title: "Developr", level_of_interest: 40, city: "Denver", company: company, category: category)
      job = Job.create!(title: "Develoer", level_of_interest: 40, city: "Home", company: company_2, category: category)
      job = Job.create!(title: "Develper", level_of_interest: 40, city: "Home", company: company_2, category: category)

      visit dashboard_path

      expect(page).to have_content("Home")
      expect(page).to have_content("Denver")
      expect(page).to have_content("2")
      expect(page).to have_content("3")
    end
  end
end
