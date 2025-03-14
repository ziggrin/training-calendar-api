require "test_helper"

class Api::V1::CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_category = api_v1_categories(:one)
  end

  test "should get index" do
    get api_v1_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_category_url
    assert_response :success
  end

  test "should create api_v1_category" do
    assert_difference("Api::V1::Category.count") do
      post api_v1_categories_url, params: { api_v1_category: { name: "Unique Category #{Time.now.to_i}" } }
    end

    assert_redirected_to api_v1_category_url(Api::V1::Category.last)
  end

  test "should show api_v1_category" do
    get api_v1_category_url(@api_v1_category)
    assert_response :success
  end
  

  test "should get edit" do
    get edit_api_v1_category_url(@api_v1_category)
    assert_response :success
  end

  test "should update api_v1_category" do
    patch api_v1_category_url(@api_v1_category), params: { api_v1_category: { name: @api_v1_category.name } }
    assert_redirected_to api_v1_category_url(@api_v1_category)
  end

  test "should destroy api_v1_category" do
    assert_difference("Api::V1::Category.count", -1) do
      delete api_v1_category_url(@api_v1_category)
    end

    assert_redirected_to api_v1_categories_url
  end
end
