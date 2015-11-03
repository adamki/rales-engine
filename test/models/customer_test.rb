require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  test "a customer has many invoices" do
    customer = Customer.create(first_name: "adam")
    invoice  = Invoice.create(status: "active")
    customer.invoices << invoice

    assert_equal 1, customer.invoices.count
  end

  test "a customer has many transactions" do
    skip
    customer = Customer.create(first_name: "adam")
    transaction = Transaction.create(
                   credit_card_number: "1234123412341234",
                   credit_card_expiration_date: "0815")
    customer.transactions << transaction

    assert_equal 1, customer.transactions.count
  end

end
