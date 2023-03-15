require 'rails_helper'

RSpec.describe Room, type: :model do

  subject {
    described_class.new(name: "suite luxury", price: 10, owner: User.create(name: "Peter"))
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  # it "create a room" do
  #   room = subject.create_room("Greek Island", 10.2)
  #   expect(room).to_not be_valid
  # end

  it "check into a room"

  it "check out from a room"

  it "not able to check into a accupied room"

  it "not able to check into a room owned by himself"

  it "not able to check into a room when is a guest in another room"

  it "consult a list of his guests"

  it "create invoices"

  it "set the invoice as paid"

end
