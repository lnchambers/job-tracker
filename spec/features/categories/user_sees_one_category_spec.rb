require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees a category" do
    job = create(:job)

    visit category_path(job.category_id)

    expect(current_path).to eq("/categories/#{job.category.id}")
    expect(page).to have_content("Eupanifahorious")
    expect(page).to have_content("Work For Free")
  end
end
