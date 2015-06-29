class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :name
      t.string :number
      t.text :from
      t.text :to
      t.string :total
      t.string :subtotal
      t.text :contact

      t.timestamps
    end
  end
end
