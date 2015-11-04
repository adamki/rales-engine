class Item < ActiveRecord::Base
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  belongs_to :merchant

  def self.ci_where(name)
    Item.where("lower(name) = ?", "#{name}".downcase)
  end
end
