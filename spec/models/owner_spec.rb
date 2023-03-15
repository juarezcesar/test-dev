require 'rails_helper'

RSpec.describe Owner, type: :model do


  subject {
    described_class.create(name: "Peter")
  }

  describe "Action on a room:" do

    it "create a room" do
      room = subject.create_room( 'Greek Islands', 10)
      expect(room).to be_valid
    end

  end

  it "consult a list of his guests"

  it "create invoices"

  it "set the invoice as paid"

end
