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
#  sale_file_id     :bigint           not null
#
# Indexes
#
#  index_company_sales_on_sale_file_id  (sale_file_id)
#
class CompanySale < ApplicationRecord
  belongs_to :sale_file

  validates :item_description, presence: true
  validates :item_price, presence: true
  validates :merchant_address, presence: true
  validates :merchant_name, presence: true
  validates :purchase_count, presence: true
  validates :purchaser_name, presence: true
end
