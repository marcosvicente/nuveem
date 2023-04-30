class CreateSaleFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_files do |t|
      t.string :file
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
