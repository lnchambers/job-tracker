require "rails_helper"

describe "As a User" do
  describe "when I visit tags/:id/edit" do
    it "I can edit an existing tag" do
      tag = create(:tag)

      visit edit_tag_path(tag)

      fill_in "tag[title]", with: "Opakawaga"
      click_on "Update Tag"

      expect(page).to have_content("Opakawaga")
    end
  end
end
