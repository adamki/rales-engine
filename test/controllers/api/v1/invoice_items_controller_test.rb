require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase

  test "#index" do
    get :index, format: :json
    assert_response :success
  end

  test "#index has correct amount of objects" do
    invoice_item_count = InvoiceItem.count
    get :index, format: :json

    assert invoice_item_count, json_response.count
    assert_response :success
  end

  test "#show" do
    invoice_item = invoice_items(:invoice_item_one)
    get :show, id: invoice_item.id, format: :json
    json_response
    unit_price = "13635"

    assert_response :success
    assert_equal unit_price, invoice_item[:unit_price]
  end

  test "#find" do
    invoice_item = invoice_items(:invoice_item_one)
    get :find, format: :json, created_at: invoice_item.created_at
    invoice_item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
  end

  test "#find_all" do
    invoice_item = invoice_items(:invoice_item_one)
    get :find_all, format: :json, merchant_id: invoice_item.created_at
    invoice_item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
  end
end
