class AddMerchantIdToItem < ActiveRecord::Migration
  def change
    add_foreign_key :items, :merchants
    add_foreign_key :merchants, :items
  end
end
