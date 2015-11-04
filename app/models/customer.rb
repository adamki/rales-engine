class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.ci_where_first_name(name)
    Customer.where("lower(first_name) = ?", "#{name}".downcase).first
  end

  def self.ci_where_last_name(name)
    Customer.where("lower(last_name) = ?", "#{name}".downcase).first
  end

  def favorite_merchant

  end


end
