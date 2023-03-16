require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/user/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /checkin" do
    it "returns http success" do
      get "/user/checkin"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /checkout" do
    it "returns http success" do
      get "/user/checkout"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create_room" do
    it "returns http success" do
      get "/user/create_room"
      expect(response).to have_http_status(:success)
    end
  end

end
