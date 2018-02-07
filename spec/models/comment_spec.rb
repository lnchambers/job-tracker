require 'rails_helper'

describe Comment do
  describe "Validations" do
    context "invalid attributes" do
      it "is invalid without a body" do
        comment = Comment.new()

        expect(comment).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a body" do
        comment = create(:comment)

        expect(comment).to be_valid
      end
    end
  end

  describe "Relationships" do
    it "belongs to a job" do
      comment = create(:comment)

      expect(comment).to respond_to(:job)
    end
  end
end
