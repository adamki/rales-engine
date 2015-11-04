class Api::V1::InvoicesController < ApplicationController
  respond_to :json

  def index
    invoices = Invoice.all
    respond_with invoices
  end

  def show
    respond_with Invoice.find_by(id: params[:id])
  end

  def find
    respond_with Invoice.where(invoice_params).first
  end

  def find_all
    respond_with Invoice.where(invoice_params)
  end

  def random
    rand_id = rand(Invoice.count)
    respond_with Invoice.find_by(id: rand_id)
  end

  def transactions
    respond_with Invoice.find_by(id: invoice_params[:invoice_id]).transactions
  end

  def items
    respond_with Invoice.find_by(id: invoice_params[:invoice_id]).items
  end

  def invoice_items
    respond_with Invoice.find_by(id: invoice_params[:invoice_id]).invoice_items
  end

  def customer
    respond_with Invoice.find_by(id: invoice_params[:invoice_id]).customer
  end

  def merchant
    respond_with Invoice.find_by(id: invoice_params[:invoice_id]).merchant
  end

  private

  def invoice_params
    params.permit(:id,
                  :status,
                  :merchant_id,
                  :customer_id,
                  :invoice_id,
                  :created_at,
                  :updated_at)
  end
end
