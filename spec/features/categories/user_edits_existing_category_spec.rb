require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = create(:category)
    visit edit_category_path(category)

    fill_in "category[title]", with: "EA Sports"
    click_button "Update"

    expect(current_path).to eq("/categories/1")
    expect(page).to have_content("EA Sports")
    expect(page).to_not have_content(category.title)
  end
end
