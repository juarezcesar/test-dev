require 'rails_helper'

RSpec.describe User, type: :model do

  fixtures :users

  context "Bas"

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

  describe "Action on a room" do

    it "create a room" do
      room = subject.create_room( 'Greek Islands', 10)
      expect(room).to be_valid
    end

    it "check in" do
      owner = User.create(name: "John")
      room = owner.create_room('Greek Islands')
      expect(subject.check_in(room)).to be_truthy
    end

    it "check out" do
      owner = User.create(name: "John")
      room = owner.create_room('Greek Islands')
      subject.check_in(room)
      expect(subject.check_out()).to be_truthy    
    end

    it "not able to check into a room owned by yourself" do
      room = subject.create_room('Greek Islands')
      expect(subject.check_in(room)).to_not be_truthy    
    end

    it "not able to check into a room occupied" do
      owner = User.create(name: "John")
      room = owner.create_room('Greek Islands')
      guest1 = User.create(name: "Paul")
      guest1.check_in(room)
      expect(subject.check_in(room)).to_not be_truthy
    end


  end

  it "consult a list of his guests"

  it "create invoices"

  it "set the invoice as paid"

end
