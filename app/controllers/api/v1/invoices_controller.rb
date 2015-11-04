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
    respond_with Invoice.where(invoice_params).first
  end

  def random
    rand_id = rand(Invoice.count)
    respond_with Invoice.find_by(id: rand_id)
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
