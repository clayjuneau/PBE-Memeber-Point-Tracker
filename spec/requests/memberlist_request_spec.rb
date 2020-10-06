require 'rails_helper'

RSpec.describe "Memberlists", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/memberlist/index"
      expect(response).to have_http_status(:success)
    end
  end

end
