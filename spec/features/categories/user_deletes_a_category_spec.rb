require 'rails_helper'

describe "User deletes existing category" do
  scenario "a user can delete a category" do
    create(:category)
    visit categories_path

    click_link "Delete"

    expect(page).to have_content("Eupanifahorious was successfully deleted!")
  end
end
