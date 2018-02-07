require 'rails_helper'

describe "User creates a new comment" do
  scenario "a user can create a new comment" do
    job = create(:job)
    visit job_path(job)

    fill_in "comment[body]", with: "Words. All words."
    click_button "Create Comment"

    expect(current_path).to eq("/jobs/1")
    expect(page).to have_content("Opakawagalaga")
    expect(page).to have_content("Words. All words.")
  end
end
