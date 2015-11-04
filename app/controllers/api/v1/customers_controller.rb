class Api::V1::CustomersController < ApplicationController

  respond_to :json

  def index
    customers = Customer.all
    respond_with customers
  end

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def find
    respond_with Customer.find_by(customer_params)
  end

  def find_all
    respond_with Customer.where(customer_params)
  end

  def random
    rand_id = rand(Customer.count)
    respond_with Customer.find_by(id: rand_id)
  end

  def invoices
    respond_with Customer.find_by(id: customer_params[:customer_id]).invoices
  end

  def transactions
    respond_with Customer.find_by(id: customer_params[:customer_id]).transactions
  end

  def favorite_merchant
    respond_with Customer.find_by(id: customer_params[:customer_id]).favorite_merchant
  end

  private

  def customer_params
    params.permit(:id, :first_name, :last_name, :customer_id, :created_at, :updated_at)
  end
end
