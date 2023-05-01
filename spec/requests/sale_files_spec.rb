require 'rails_helper'

RSpec.describe "SaleFiles", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/sale_files/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    let(:sale_file) { create(:sale_file)}
    it "returns http success" do
    
      get "/sale_files/#{sale_file.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/sale_files/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    let(:file) { fixture_file_upload('example_input.tab') }

    let(:valid_attributes) { attributes_for(:sale_file, file:) } 
    let(:invalid_attributes) { attributes_for(:sale_file, file: 'a') } 

    context 'with valid parameters' do
      it 'creates a new SaleFile' do
        expect do
          post sale_files_url, params: { sale_file: valid_attributes }
        end.to change(SaleFile, :count).by(1)
      end

      it 'redirects to the created SaleFile' do
        post sale_files_url, params: { sale_file: valid_attributes }

        expect(response).to redirect_to(sale_file_url(SaleFile.last.id))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new SaleFile' do
        expect do
          post sale_files_url, params: { sale_file: invalid_attributes }
        end.to change(SaleFile, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post sale_files_url, params: { sale_file: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
