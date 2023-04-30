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
class CompanySale < ApplicationRecord
  belongs_to :sales_file

  validates :item_description, presence: true
  validates :item_price, presence: true
  validates :merchant_address, presence: true
  validates :merchant_name, presence: true
  validates :purchase_count, presence: true
  validates :purchaser_name, presence: true
end
