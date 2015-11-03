require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  test "a merchant has many items" do
    merchant = Merchant.create(name: "Target")
    item   = Item.create(name: "stereo")
    item_2 = Item.create(name: "guitar")
    item_3 = Item.create(name: "macbook")
    merchant.items << item
    merchant.items << item_2
    merchant.items << item_3
    assert_equal 3,merchant.items.count
  end

  test "a merchant has many invoices" do
    merchant   = Merchant.create(name: "Target")
    invoice    = Invoice.create(status: "active")
    invoice_2  = Invoice.create(status: "active")
    invoice_3  = Invoice.create(status: "active")
    merchant.invoices << invoice
    merchant.invoices << invoice_2
    merchant.invoices << invoice_3

    assert_equal 3, merchant.invoices.count
  end
end
