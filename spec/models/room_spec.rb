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

  it "is not valid if the owner and guest are the same" do
    subject.guest = subject.owner
    expect(subject).to_not be_valid
  end

  it "calculate the total price" do
    guest = Guest.create(name: "Paul") 
    time_now = Time.now
    guest.check_in(subject, time_now)

    expect(subject.calculate_total(time_now + 30.minutes)).to eq 30*subject.price
  end

end
