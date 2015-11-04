class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items

  has_many :customers, through: :invoices

  def favorite_customer
    customers.select("customers.*, count(invoices.customer_id) AS invoice_count")
             .joins(invoices: :transactions)
             .merge(Transaction.successful)
             .group("customers.id")
             .order("invoice_count DESC").uniq
  end

  def pending_invoices
    customers.select("customers.* AS invoice_count")
                      .joins(invoices: :transactions)
                      .merge(Transaction.failed)
  end
end
