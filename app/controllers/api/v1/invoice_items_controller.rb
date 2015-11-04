class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json

  def index
    invoice_items = InvoiceItem.all
    respond_with invoice_items
  end

  def show
    respond_with InvoiceItem.find_by(id: params[:id])
  end

  def find
    respond_with InvoiceItem.where(invoice_item_params).first
  end

  def find_all
    respond_with InvoiceItem.where(invoice_item_params)
  end

  def random
    rand_id = rand(InvoiceItem.count)
    respond_with InvoiceItem.find_by(id: rand_id)
  end

  def item

  end

  def invoice

  end

  private

    def invoice_item_params
      params.permit(:id,
                    :item_id,
                    :invoice_id,
                    :quantity,
                    :unit_price,
                    :invoice_item_id,
                    :created_at,
                    :updated_at)
    end
end
