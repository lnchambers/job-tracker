require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    create(:category)
    create(:category, name: "ESPN")

    visit categories_path

    expect(page).to have_content("ESPN")
  end

end
