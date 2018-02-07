require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    create(:category)
    create(:category, title: "Heelo?")

    visit categories_path

    expect(page).to have_content("Heelo?")
  end

end
