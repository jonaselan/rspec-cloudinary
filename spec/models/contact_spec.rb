require 'rails_helper'

describe Contact, type: :model do

  it "has three phone numbers" do
    # TODO find other match to do this
    expect(create(:contact).phones.count).to eq(3)
  end

  it "is valid with a firstname, lastname and email" do
    contact = build(:contact)
    expect(contact).to be_valid
  end

  it "is invalid without a firstname" do
    contact = build(:contact, firstname: nil)
    contact.valid?
    expect(contact.errors[:firstname]).not_to include("can't be blank")
  end

  it "returns a contact's full name as a string" do
    contact = Contact.new(
      firstname: 'John',
      lastname: 'Doe',
      email: 'johndoe@example.com'
    )
    expect(contact.name).to eq 'John Doe'
  end

  describe "filter last name by letter" do
    before :each do
      # @siria = Contact.create(:contact,
      @siria = create(:contact,
        firstname: 'John',
        lastname: 'Smith',
        email: 'jsmith@example.com'
      )
      # @jonas = Contact.create(:contact,
      @jonas = create(:contact,
        firstname: 'Tim',
        lastname: 'Jones',
        email: 'tjones@example.com'
      )
      # @jario = Contact.create(:contact,
      @jario = create(:contact,
        firstname: 'John',
        lastname: 'Johnson',
        email: 'jjohnson@example.com'
      )
    end

    context "with matching letters" do
      it "returns a sorted array of results that match" do
        expect(Contact.by_letter("J")).to eq [@jario, @jonas]
      end
    end

    context "with non-matching letters" do
      it "omits results that do not match" do
        expect(Contact.by_letter("J")).not_to include @smith
      end
    end
  end
end
