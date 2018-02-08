require "rails_helper"

describe "As a user" do
  describe "when I visit the tags index" do
    it "I can see all tags" do
      create(:tag)
      Tag.create!(title: "Everything is Hashes")

      visit tags_path

      expect(page).to have_content("Everything is Hashes")
    end
  end
end
