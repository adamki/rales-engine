class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    merchants = Merchant.all
    respond_with merchants
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def find
    respond_with Merchant.where(merchant_params).first
  end

  def find_all
    respond_with Merchant.where(merchant_params)
  end

  def random
    rand_id = rand(Merchant.count)
    respond_with Merchant.find_by(id: rand_id)
  end

  def items
    respond_with current_merchant.items
  end

  def invoices
    respond_with current_merchant.invoices
  end

  def get_successful_invoices
    current_merchant.invoices.success
  end

  def get_pending_invoices
    current_merchant.invoices.pending
  end

  def favorite_customer
    respond_with current_merchant.favorite_customer
  end

  def customers_with_pending_invoices
    pending_transactions = get_pending_invoices
    customers = pending_transactions.joins(:customer).uniq
    respond_with customers
  end

  def most_revenue

    respond_with Merchant.select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue")
        .joins(:invoice_items)
        .joins(:transactions)
        .where(transactions: { result: 'success' })
        .group("merchants.id")
        .order("total_revenue DESC")
        .limit(params["quantity"])

  end

  private


  def merchant_params
    params.permit(:id,
                  :name,
                  :merchant_id,
                  :date,
                  :created_at,
                  :updated_at,
                  :quantity)
  end

  def current_merchant
    Merchant.find_by(id: merchant_params[:merchant_id])
  end
end
