require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  test "a customer has many invoices" do
    customer = Customer.create(first_name: "adam")
    invoice  = Invoice.create(status: "active")
    customer.invoices << invoice

    assert_equal 1, customer.invoices.count
  end

end
