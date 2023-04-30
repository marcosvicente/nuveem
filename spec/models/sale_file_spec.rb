# == Schema Information
#
# Table name: sale_files
#
#  id         :bigint           not null, primary key
#  file       :string
#  status     :integer          default("enqueued"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe SaleFile, type: :model do
  it { is_expected.to validate_presence_of(:file) }
end
