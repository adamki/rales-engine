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
    if customer_params.has_key?(:first_name)
      name = customer_params[:first_name]
      respond_with Customer.ci_where_first_name(name)
    elsif customer_params.has_key?(:last_name)
      name = customer_params[:last_name]
      respond_with Customer.ci_where_last_name(name)
    else
      respond_with Customer.where(customer_params).first
    end
  end

  def find_all
    respond_with Customer.where(customer_params)
  end

  def random
    rand_id = rand(Customer.count)
    respond_with Customer.find_by(id: rand_id)
  end

  def invoices
    byebug
    respond_with Customer.find_by(id: customer_params[:customer_id]).invoices
  end

  def transactions
    respond_with Customer.find_by(id: customer_params[:customer_id]).transactions
  end
  private

  def customer_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end
