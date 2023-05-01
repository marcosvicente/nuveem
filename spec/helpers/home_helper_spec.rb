require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe HomeHelper, type: :helper do
  context ".total_sale_all_time" do
    let(:sale_file) { create(:sale_file)}
    let(:total_sales) { create_list(:company_sale, 10, sale_file:)}

    it "should be return a total sale all time" do
      expect(helper.total_sale_all_time).to eq(CompanySale.all.sum(:item_price))
    end
  end
end
