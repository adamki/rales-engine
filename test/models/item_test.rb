require 'test_helper'

class ItemTest < ActiveSupport::TestCase

  test "an item belongs to a merchant" do
    item = Item.create(name: "stereo")
    merchant = Merchant.create(name: "Target")
    merchant.items << item
    assert_equal 1,merchant.items.count
  end
end
