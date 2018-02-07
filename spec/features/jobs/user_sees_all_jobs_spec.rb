require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    company = create(:company)
    category = create(:category)
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
    job_2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category: category)

    visit company_path(company)

    expect(page).to have_content(job.company.name)
    expect(page).to have_content(job.title)
    expect(page).to have_content(job_2.title)
  end
end
