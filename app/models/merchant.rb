class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items

  has_many :customers, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def favorite_customer
    customers.select("customers.*, count(invoices.customer_id) AS invoice_count")
             .joins(invoices: :transactions)
             .merge(Transaction.successful)
             .group("customers.id")
             .order("invoice_count DESC")
             .first
  end

  def self.revenue(id, date = nil)
    if date
      InvoiceItem.joins(:transactions)
      .where("transactions.result" => "success")
      .joins(:merchants).where("merchants.id" => id)
      .joins(:invoice).where("invoices.created_at" => date)
      .sum("invoice_items.quantity * invoice_items.unit_price")
    else
       InvoiceItem.joins(:transactions)
      .where("transactions.result" => "success")
      .joins(:merchants).where("merchants.id" => id)
      .sum("invoice_items.quantity * invoice_items.unit_price")
    end
  end

  def self.most_items(quantity)
    select("merchants.*, sum(invoice_items.quantity) AS total_sold")
    .joins(:invoice_items)
    .group("merchants.id")
    .order("total_sold DESC")
    .limit(quantity)
    .merge(InvoiceItem.successful)
  end




end
