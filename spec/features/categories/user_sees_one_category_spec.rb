require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees a category" do
    job = create(:job)

    visit category_path(job.category_id)

    expect(current_path).to eq("/companies/#{job.category_id}/jobs")
    expect(page).to have_content("Opakawagalaga")
    expect(page).to have_content("Work For Free")
  end
end
