class AddInvoiceItemToItem < ActiveRecord::Migration
  def change
    add_foreign_key :item, :invoice_items
    add_foreign_key :invoice_items, :item
  end
end
