require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees a category" do
    category = create(:category)

    visit category_path(category)

    expect(current_path).to eq("/companies/#{job.category_id}/jobs")
    expect(page).to have_content("Opakawagalaga")
    expect(page).to have_content("Work For Free")
  end
end
