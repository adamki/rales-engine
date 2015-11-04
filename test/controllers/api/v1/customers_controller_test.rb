require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase

  test "#index" do
    get :index, format: :json
    assert_response :success
  end

  test "#index has correct amount of objects" do
    customer_count = Customer.count
    get :index, format: :json

    assert customer_count, json_response.count
    assert_response :success
  end

  test "#show" do
    customer = customers(:customer_one)
    get :show, id: customer.id, format: :json
    json_response

    assert_response :success
    assert_equal "Jeff", customer[:first_name]
  end

  test "#find" do
    customer = customers(:customer_one)
    get :find, format: :json, name: customer.first_name
    customer = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
  end

  test "#find_all" do
    customer = customers(:customer_one)
    get :find_all, format: :json, merchant_id: customer.last_name
    customer = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
  end

  test "#favorite_merchant" do


  end

end
