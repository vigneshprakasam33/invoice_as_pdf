class AddTaxToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :tax, :string
  end
end
