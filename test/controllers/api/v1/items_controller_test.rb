require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase

  test "#index" do
    get :index, format: :json
    assert_response :success
  end

  test "#index has correct amount of objects" do
    item_count = Item.count
    get :index, format: :json

    assert item_count, json_response.count
    assert_response :success
  end

  test "#show" do
    item = items(:one)
    get :show, id: item.id, format: :json
    json_response
    price = item[:unit_price]

    assert_response :success
    assert_equal "Item Qui Esse", item[:name]
    assert_equal 75107, price
  end


  test "#find" do
    item = items(:one)
    get :find, format: :json, name: item.name
    item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
  end

  test "#find_all" do
    item = items(:one)
    get :find_all, format: :json, merchant_id: item.merchant_id
    item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
  end


  def json_response
    JSON.parse(response.body)
  end

  def format_price(price)
    price.insert(0, "$")
    price.insert(-3, ".")
  end
end
