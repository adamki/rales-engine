require 'csv'
require 'bigdecimal'

class ParseService

  def self.import_all
    puts "importing customers"
    import_customers
    import_invoice_items
    import_invoices
    import_items
    import_merchants
    import_transactions

    puts "All Data has been imported successfully"
  end

  def self.import_customers
    CSV.foreach("db/data/customer.csv", headers: true, header_converters: :symbol) do |row|
      Customer.create!(row.to_hash)
    end
  end

  def self.import_invoices
    puts "importing invoices"
    CSV.foreach("db/data/invoices.csv", headers: true, header_converters: :symbol) do |row|
      Invoice.create!(row.to_hash)
    end
  end

  def self.import_merchants
    puts "importing merchants"
    CSV.foreach("db/data/merchants.csv", headers: true, header_converters: :symbol) do |row|
      Merchant.create!(row.to_hash)
    end
  end

  def self.import_transactions
    puts "importing transactions"
    CSV.foreach("db/data/transactions.csv", headers: true, header_converters: :symbol) do |row|
      Transaction.create!(row.to_hash)
    end
  end

  def self.import_items
    puts "importing items"
    CSV.foreach("db/data/items.csv", headers: true, header_converters: :symbol) do |row|
      Item.create!(id: row[:id],
                name: row[:name],
         description: row[:description],
         unit_price: '%.2f' % (row[:unit_price].to_i/100.0),
         merchant_id: row[:merchant_id],
          created_at: row[:created_at],
          updated_at: row[:updated_at])
    end
  end

  def self.import_invoice_items
    puts "importing invoice items"
    CSV.foreach("db/data/invoice_items.csv", headers: true, header_converters: :symbol) do |row|
      InvoiceItem.create!(id: row[:id],
                    item_id: row[:item_id],
                 invoice_id: row[:invoice_id],
                   quantity: row[:quantity],
                 unit_price: BigDecimal.new(row[:unit_price].insert(-3, ".")),
                 created_at: row[:created_at],
                 updated_at: row[:updated_at])
    end
  end

end
