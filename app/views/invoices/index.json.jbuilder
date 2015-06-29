json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :name, :number, :from, :to, :total, :subtotal, :contact
  json.url invoice_url(invoice, format: :json)
end
