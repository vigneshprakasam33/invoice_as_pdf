class AddUuidToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :uuid, :uuid
  end
end
