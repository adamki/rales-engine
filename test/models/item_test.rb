require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  test "an item belongs to a merchant" do
    item = Item.create(name: "stereo")
    merchant = Merchant.create(name: "Target")
    merchant.items << item
    assert_equal 1,merchant.items.count
  end

  test "an item has many invoice items" do
    item = Item.create(name: "stereo")
    invoice_item = InvoiceItem.create(quantity: "12")
    item.invoice_items << invoice_item
    assert_equal "12", item.invoice_items.first.quantity
  end

  test "an item has many invoices through invoice items" do
    item = Item.create(name: "stereo")
    invoice = Invoice.create(status: "active")
    item.invoices << invoice
  end


end
