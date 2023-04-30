# == Schema Information
#
# Table name: sale_files
#
#  id         :bigint           not null, primary key
#  files      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SaleFile < ApplicationRecord
  has_one :company_sales

  mount_uploader :file, SaleFileUploader

  validates :file, presence: true

  enum status: [:enqueued, :processing, :done, :error]
end
