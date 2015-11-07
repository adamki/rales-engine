class Item < ActiveRecord::Base
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  belongs_to :merchant

  before_create :money_converter

  def self.most_revenue(quantity)
    select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .joins(:invoice_items)
    .group("items.id")
    .order("revenue DESC")
    .limit(quantity)
  end

  def self.ci_where(name)
    Item.where("lower(name) = ?", "#{name}".downcase)
  end

  protected

  def money_converter
    self.unit_price = (self.unit_price.to_f/100)
  end
end


#
