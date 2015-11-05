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


end
