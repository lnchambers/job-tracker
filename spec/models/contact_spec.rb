require 'rails_helper'

describe Contact do
  describe "Validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        contact = Contact.new(position: "To be filled", email: "no@no.no")

        expect(contact).to be_invalid
      end

      it "is invalid without a position" do
        contact = Contact.new(name: "To be filled", email: "no@no.no")

        expect(contact).to be_invalid
      end

      it "is invalid without a email" do
        contact = Contact.new(name: "To be filled", position: "no@no.no")

        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with all attributes present" do
        contact = create(:contact)

        expect(contact).to be_valid
      end
    end
  end

  describe "Relationships" do
    it "belongs to a company" do
      contact = create(:contact)

      expect(contact).to respond_to(:company)
    end
  end
end
