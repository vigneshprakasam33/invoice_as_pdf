class AddColumnsToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices , :from_name , :string
    add_column :invoices , :to_name , :string
    add_column :invoices , :from_details , :text
    add_column :invoices , :to_details , :text
  end
end
