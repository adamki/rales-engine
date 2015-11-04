require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json
    assert_response :success
  end

  test "#index has correct amount of objects" do
    invoice_count = Invoice.count
    get :index, format: :json

    assert invoice_count, json_response.count
    assert_response :success
  end

  test "#show" do
    invoice = invoices(:invoice_one)
    get :show, id: invoice.id, format: :json
    json_response

    assert_response :success
  end

  test "#find" do
    invoice = invoices(:invoice_one)
    get :find, format: :json, name: invoice.merchant
    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
  end

  test "#find_all" do
    invoice = invoices(:invoice_one)
    get :find_all, format: :json, merchant_id: invoice.status

    assert_response :success
  end

  def json_response
    JSON.parse(response.body)
  end
end
