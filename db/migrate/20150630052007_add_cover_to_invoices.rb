class AddCoverToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :cover, :text
  end
end
