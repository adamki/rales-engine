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

end
