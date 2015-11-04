class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    items = Item.all
    respond_with items
  end

  def show
    respond_with Item.find_by(id: params[:id])
  end

  def find
    if item_params.has_key?(:name)
      name = item_params[:name].titleize
      respond_with Item.ci_where(name).first
    else
      respond_with Item.where(item_params).first
    end
  end

  def find_all
    respond_with Item.where(item_params)
  end

  def random
    rand_id = rand(Item.count)
    respond_with Item.find_by(id: rand_id)
  end

  def invoice_items
    respond_with Item.find_by(id: item_params[:item_id]).invoice_items
  end

  def merchant
    respond_with Item.find_by(id: item_params[:item_id]).merchant
  end

  private

    def item_params
      params.permit(:id,
                    :name,
                    :description,
                    :unit_price,
                    :merchant_id,
                    :item_id,
                    :created_at,
                    :updated_at,
                    :quantity)
    end
end
