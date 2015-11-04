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
    respond_with Merchant.find_by(id: merchant_params[:merchant_id]).items
  end

  def invoices
    respond_with Merchant.find_by(id: merchant_params[:merchant_id]).invoices
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
end
