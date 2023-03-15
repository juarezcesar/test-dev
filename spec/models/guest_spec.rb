require 'rails_helper'

RSpec.describe Guest, type: :model do


  subject {
    described_class.create(name: "Peter")
  }

  it "check in" do
    owner = Owner.create(name: "John")
    room = owner.create_room('Greek Islands')
    expect(subject.check_in(room)).to be_truthy
  end

  it "check out" do
    owner = Owner.create(name: "John")
    room = owner.create_room('Greek Islands')
    subject.check_in(room)
    expect(subject.check_out()).to be_truthy    
  end  

  it "not able to check into a room owned by yourself" do    
    room = subject.as_owner.create_room('Greek Islands')
    expect(subject.check_in(room)).to_not be_truthy    
  end

  it "not able to check into a room occupied" do
    owner = Owner.create(name: "John")
    room = owner.create_room('Greek Islands')
    guest1 = Guest.create(name: "Paul")
    guest1.check_in(room)
    expect(subject.check_in(room)).to_not be_truthy
  end

  it "not able to check into a room while is hosted" do
    owner = Owner.create(name: "John")
    room1 = owner.create_room('Greek Islands')
    room2 = owner.create_room('Phillippine Islands')
    subject.check_in(room1)
    expect(subject.check_in(room2)).to_not be_truthy
  end

  it "consult a list of his guests"

  it "create invoices"

  it "set the invoice as paid"

end
