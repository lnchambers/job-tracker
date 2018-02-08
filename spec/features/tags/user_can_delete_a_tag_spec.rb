require "rails_helper"

describe "As a User" do
  describe "when I visit the tag index page" do
    it "I can delete a tag" do
      tag =create(:tag)

      visit tags_path

      expect(page).to have_content(tag.title)

      click_on "Delete"

      expect(page).to have_content("#{tag.title} was successfully deleted!")
    end
  end
end
