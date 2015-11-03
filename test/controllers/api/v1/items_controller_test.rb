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

  test "#show has the correct attributes" do
    byebug
  end

  def json_response
    JSON.parse(response.body)
  end
end
