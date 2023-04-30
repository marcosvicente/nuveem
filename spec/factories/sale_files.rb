# == Schema Information
#
# Table name: sale_files
#
#  id         :bigint           not null, primary key
#  files      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
include ActionDispatch::TestProcess

FactoryBot.define do
  factory :sale_file do
    file {  File.new(Rails.root.join('spec', 'fixtures', 'files', 'example_input.tab' )) }
  end
end
