class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :service
      t.text :description
      t.string :quantity
      t.string :price
      t.string :subtotal
      t.integer :invoice_id

      t.timestamps
    end
  end
end
