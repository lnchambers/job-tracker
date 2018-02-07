require "rails_helper"

describe "As a user" do
  describe "when I visit jobs dashboard" do
    scenario "I can see the top three companies" do
      category = create(:category)
      company = Company.create!(name: "Turing")
      company_2 = Company.create!(name: "Not Turing")
      company_3 = Company.create!(name: "Opakawagalaga")
      Company.create!(name: "Eupanifahorious")
      Job.create!(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category: category)
      Job.create!(title: "Develope", level_of_interest: 40, city: "Denver", company: company, category: category)
      Job.create!(title: "Developr", level_of_interest: 40, city: "Denver", company: company, category: category)
      Job.create!(title: "Develoer", level_of_interest: 40, city: "Home", company: company_2, category: category)
      Job.create!(title: "Develper", level_of_interest: 40, city: "Home", company: company_2, category: category)
      Job.create!(title: "Devloper", level_of_interest: 40, city: "Home", company: company_3, category: category)

      visit dashboard_path

      expect(page).to have_content("Turing")
      expect(page).to have_content("Not Turing")
      expect(page).to have_content("Opakawagalaga")
      expect(page).to_not have_content("Eupanifahorious")
    end
  end
end
