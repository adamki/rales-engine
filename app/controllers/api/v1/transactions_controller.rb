class Api::V1::TransactionsController < ApplicationController
  respond_to :json

  def index
    transactions = Transaction.all
    respond_with transactions
  end

  def show
    respond_with Transaction.find_by(id: params[:id])
  end

  def find
    respond_with Transaction.where(transaction_params).first
  end

  def find_all
    respond_with Transaction.where(transaction_params)
  end

  def random
    rand_id = rand(Transaction.count)
    respond_with Transaction.find_by(id: rand_id)
  end

  def invoice
    respond_with Transaction.find_by(id: transaction_params[:transaction_id]).invoice
  end

  private

  def transaction_params
    params.permit(:id,
                  :credit_card_number,
                  :result,
                  :invoice_id,
                  :transaction_id,
                  :created_at,
                  :updated_at)
  end
end
