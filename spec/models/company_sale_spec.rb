# == Schema Information
#
# Table name: company_sales
#
#  id               :bigint           not null, primary key
#  item_description :string
#  item_price       :decimal(, )
#  merchant_address :string
#  merchant_name    :string
#  purchase_count   :integer
#  purchaser_name   :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  file_id          :bigint           not null
#
# Indexes
#
#  index_company_sales_on_file_id  (file_id)
#
# Foreign Keys
#
#  fk_rails_...  (file_id => sale_files.id)
#
require 'rails_helper'

RSpec.describe CompanySale, type: :model do

  let!(:sale_file) { create(:sale_file )}
  subject(:company_sale) { build(:company_sale, sale_file:) }
  
  it { should belong_to(:sales_file) }
  it { is_expected.to validate_presence_of(:item_description) }
  it { is_expected.to validate_presence_of(:item_price) }
  it { is_expected.to validate_presence_of(:merchant_address) }
  it { is_expected.to validate_presence_of(:merchant_name) }
  it { is_expected.to validate_presence_of(:purchase_count) }
  it { is_expected.to validate_presence_of(:purchaser_name) }
end
