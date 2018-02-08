require "rails_helper"

describe "As a User" do
  describe "when I visit tags/:id/edit" do
    it "I can create a tag" do
      visit new_tag_path

      fill_in "tag[title]", with: "Opakawagalaga Eupanifahorious"
      click_on "Create Tag"

      expect(page).to have_content("Opakawagalaga Eupanifahorious")
    end
  end
end
