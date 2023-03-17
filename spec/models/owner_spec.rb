require 'rails_helper'

RSpec.describe Owner, type: :model do


  subject {
    described_class.create(name: "Peter")
  }

  it "create a room" do
    room = subject.create_room( 'Greek Islands', 10)
    expect(room).to be_valid
  end

  it "consult a list of his guests" do
    r1 = subject.create_room( 'Greek Islands', 10)
    r2 = subject.create_room( 'Philippine Islands', 20)

    g1 = Guest.create!(name:"Paul")
    g2 = Guest.create!(name:"Andrew")

    g1.check_in(r1)
    g2.check_in(r2)

    guest_ids = subject.guests(&:id).sort
   
    expect(guest_ids).to match_array([g1.id,g2.id].sort)
  end

   it "create invoices" do
    r1 = subject.create_room( 'Greek Islands', 20)
    r2 = subject.create_room( 'Philippine Islands', 20)

    g1 = Guest.create!(name:"Paul")
    g2 = Guest.create!(name:"Andrew")

    g1.check_in(r1)
    g2.check_in(r2)
    g1.check_out(Time.now + 10.minutes)
    g2.check_out(Time.now + 10.minutes)

    subject.create_invoices()

    expect(subject.invoices.size).to eq 2
    expect(subject.invoices.sum(&:total)).to eq 10*20+10*20
       
  end

  it "set the invoice as paid" do
    r1 = subject.create_room( 'Greek Islands', 20)
    r2 = subject.create_room( 'Philippine Islands', 20)

    g1 = Guest.create!(name:"Paul")
    g2 = Guest.create!(name:"Andrew")

    g1.check_in(r1)
    g2.check_in(r2)
    g1.check_out(Time.now + 10.minutes)
    g2.check_out(Time.now + 10.minutes)

    subject.create_invoices()

    subject.invoices.each do |i|
      subject.set_invoice_as_paid(i)
    end

    expect(subject.invoices.paid.size).to eq 2
    
  end

end
