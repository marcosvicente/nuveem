require 'rails_helper'

RSpec.describe "SaleFiles", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/sale_files/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/sale_files/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/sale_files/new"
      expect(response).to have_http_status(:success)
    end
  end

end
