require 'test_helper'

class InvoiceItemTest < ActiveSupport::TestCase

  test "an invoice item belongs to an item" do
    invoice_item = InvoiceItem.create(unit_price:"100.90")
    item = Item.create(name: "mug")
    item.invoice_items << invoice_item

    assert_equal invoice_item, item.invoice_items.first
  end

end
