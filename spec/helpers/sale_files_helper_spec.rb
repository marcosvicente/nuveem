require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SaleFilesHelper. For example:
#
# describe SaleFilesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SaleFilesHelper, type: :helper do
  context ".total_sales" do
    let(:sale_file) { create(:sale_file)}
    let(:total_sales) { create_list(:company_sale, 10, sale_file:)}

    it "should be return a total of sales" do
      expect(helper.total_sales(sale_file)).to eq(CompanySale.all.sum(:item_price))
    end
  end
end
