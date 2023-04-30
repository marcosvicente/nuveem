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
FactoryBot.define do
  factory :company_sale do
    purchaser_name { Faker::Name.name }
    item_description { Faker::Commerce.product_name }
    item_price { Faker::Commerce.price }
    purchase_count { Faker::Number.within(range: 1..10) }
    merchant_address { Faker::Address.street_address }
    merchant_name { Faker::Commerce.name  }
    sale_file { nil }
  end
end
