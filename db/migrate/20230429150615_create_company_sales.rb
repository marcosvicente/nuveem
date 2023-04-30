class CreateCompanySales < ActiveRecord::Migration[7.0]
  def change
    create_table :company_sales do |t|
      t.string :purchaser_name
      t.string :item_description
      t.decimal :item_price
      t.integer :purchase_count
      t.string :merchant_address
      t.string :merchant_name
      t.references :sales_file, null: false

      t.timestamps
    end
  end
end
