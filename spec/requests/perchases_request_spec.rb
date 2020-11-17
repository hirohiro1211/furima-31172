require 'rails_helper'

RSpec.describe "Perchases", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/perchases/index"
      expect(response).to have_http_status(:success)
    end
  end

end
