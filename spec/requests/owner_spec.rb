require 'rails_helper'

RSpec.describe "Owners", type: :request do
  describe "GET /dashboard" do
    it "returns http success" do
      o = Owner.create!(name:"Paul")

      get owner_dashboard_path(o)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /checkin" do
    it "returns http redirect" do

      guest = Guest.create(name: "Paul")
      owner = Owner.create(name: "John")
      room = owner.create_room('Greek Islands')
    
      post guest_checkin_path(guest), params: {room_id: room.id, guest_id: guest.id}
      
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "POST /checkout" do
    it "returns http redirect" do

      guest = Guest.create(name: "Paul")
      owner = Owner.create(name: "John")
      room = owner.create_room('Greek Islands')
      guest.check_in(room)

      post guest_checkout_path(guest)
      
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "POST /create_room" do
    it "returns http redirect" do

      owner = Owner.create(name: "Paul")
      room = owner.create_room('Greek Islands')
      
      post owner_rooms_path(owner), params: {room: {name: "PP01", price: 10}}
      
      expect(response).to have_http_status(:redirect)
    end
  end

end
