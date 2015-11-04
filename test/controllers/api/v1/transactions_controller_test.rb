require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json
    assert_response :success
  end

  test "#index has correct amount of objects" do
    transaction_count = Transaction.count
    get :index, format: :json

    assert transaction_count, json_response.count
    assert_response :success
  end

  test "#show" do
    transaction = transactions(:transaction_one)
    get :show, id: transaction.id, format: :json
    json_response
    number = "4654405418249632"

    assert_response :success
    assert_equal number, transaction[:credit_card_number]
  end

  test "#find" do
    transaction = transactions(:transaction_one)
    get :find, format: :json, name: transaction.credit_card_number
    transaction = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
  end

  test "#find_all" do
    transaction = transactions(:transaction_one)
    get :find_all, format: :json, merchant_id: transaction.result
    transaction = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
  end
end
