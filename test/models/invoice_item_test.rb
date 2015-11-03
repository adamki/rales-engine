require 'test_helper'

class InvoiceItemTest < ActiveSupport::TestCase

  test "an invoice item belongs to an item" do
    invoice_item = InvoiceItem.create(unit_price:"100.90")
    item = Item.create(name: "mug")
    item.invoice_items << invoice_item

    assert_equal invoice_item, item.invoice_items.first
  end

  test "an invoice item belongs to an invoice" do
    invoice_item = InvoiceItem.create(unit_price:"100.90")
    invoice = Invoice.create(status: "not-active")
    invoice.invoice_items << invoice_item

    assert_equal "100.90", invoice.invoice_items.first.unit_price
  end

end
