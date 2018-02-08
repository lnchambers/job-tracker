require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "Validations" do
    it "is invalid without a title" do
      tag = Tag.new

      expect(tag).to be_invalid
    end

    it "is valid with a title" do
      tag = create(:tag)

      expect(tag).to be_valid
    end
  end
end
