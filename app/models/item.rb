class Item < ActiveRecord::Base
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  belongs_to :merchant

  before_create :money_converter

  def self.ci_where(name)
    Item.where("lower(name) = ?", "#{name}".downcase)
  end

  protected

  def money_converter
    self.unit_price = (self.unit_price.to_f/100)
  end
end
