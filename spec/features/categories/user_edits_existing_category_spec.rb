require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = create(:category)
    visit edit_category_path(category)

    fill_in "category[name]", with: "EA Sports"
    click_button "Update"

    expect(current_path).to eq("/companies/#{Category.last.id}/jobs")
    expect(page).to have_content("EA Sports")
    expect(page).to_not have_content(category.name)
  end
end
