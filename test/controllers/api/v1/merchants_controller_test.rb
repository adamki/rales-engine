require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json
    assert_response :success
  end

  test "#index has correct amount of objects" do
    merchant_count = Merchant.count
    get :index, format: :json

    assert merchant_count, json_response.count
    assert_response :success
  end

  test "#show" do
    merchant = merchants(:merchant_one)
    get :show, id: merchant.id, format: :json
    json_response

    assert_response :success
    assert_equal "Apple", merchant[:name]
  end

  test "#find" do
    merchant = merchants(:merchant_one)
    get :find, format: :json, name: merchant.name
    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
  end

  test "#find again" do
    merchant = merchants(:merchant_one)
    get :find, format: :json, id: merchant.id
    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
  end

  test "#find_all" do
    merchant = merchants(:merchant_one)
    get :find_all, format: :json, merchant_name: merchant.name
    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
  end

  test "#favorite_customer" do
    merchant = merchants(:merchant_one)
    get :favorite_customer, format: :json, merchant_id: merchant.id
    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
  end

  test "#customers_with_pending_invoices" do
    merchant = merchants(:merchant_one)
    get :customers_with_pending_invoices, format: :json, merchant_id: merchant.id
    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
  end

  test "#most_revenue" do
    merchant = merchants(:merchant_one)
    get :most_revenue, format: :json, merchant_id: merchant.id
    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
  end

  test "#most_items" do
    merchant = merchants(:merchant_one)
    get :most_items, format: :json, merchant_id: merchant.id
    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
  end

  test "#revenue" do
    merchant = merchants(:merchant_one)
    get :revenue, format: :json, merchant_id: merchant.id
    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success

  end


end
