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

  test "#find_all" do
    merchant = merchants(:merchant_one)
    get :find_all, format: :json, merchant_name: merchant.name
    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
  end

end
