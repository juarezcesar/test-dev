require 'rails_helper'

RSpec.describe User, type: :model do

  fixtures :users

  subject {
    described_class.create(name: "Peter")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = ""
    expect(subject).to_not be_valid
  end

  it "create a room" do
    room = subject.create_room( 'Greek Islands', 10)
    expect(room).to be_valid
  end

  it "check into a room" do
    owner = User.create(name: "John")
    room = owner.create_room('Greek Islands')
    expect(subject.check_in(room)).to be_truthy
  end

  # it "check out from a room" do

  # end


  it "not able to check into a accupied room"

  it "not able to check into a room owned by himself"

  it "not able to check into a room when is a guest in another room"

  it "consult a list of his guests"

  it "create invoices"

  it "set the invoice as paid"

end
