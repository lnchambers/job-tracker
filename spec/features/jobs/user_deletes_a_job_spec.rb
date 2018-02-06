require "rails_helper"

describe "As a user" do
  scenario "I can delete a job" do
    job = create(:job)
    
    visit company_jobs_path(company, job)

    click_on "Delete"

    expect(page).to have_content("#{job.title} was successfully deleted!")
  end
end
