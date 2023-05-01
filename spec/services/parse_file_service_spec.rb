require 'rails_helper'

RSpec.describe ParseFileService, type: :service do
 
  let!(:sale_file) { create(:sale_file) }

  describe "success" do

    it "should be create a CompanySale" do
      klass = described_class.new(sale_file).call

      expect(CompanySale.count).to be >= 1

      company_sale = CompanySale.first

      expect(company_sale.purchaser_name).to eq("João Silva")
      expect(company_sale.item_description).to eq("Pepperoni Pizza Slice")
      expect(company_sale.item_price).to eq(10.0)
      expect(company_sale.purchase_count).to eq(2)
      expect(company_sale.merchant_address).to eq("987 Fake St")
      expect(company_sale.merchant_name).to eq("Bob's Pizza")
    end

    it "should be return with created sale_file with status done" do
      klass = described_class.new(sale_file).call
      
      expect(SaleFile.last.status).to eq("done")
    end
  end
end
