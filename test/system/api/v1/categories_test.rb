require "application_system_test_case"

class Api::V1::CategoriesTest < ApplicationSystemTestCase
  setup do
    @api_v1_category = api_v1_categories(:one)
  end

  test "visiting the index" do
    visit api_v1_categories_url
    assert_selector "h1", text: "Categories"
  end

  test "should create category" do
    visit api_v1_categories_url
    click_on "New category"

    fill_in "Name", with: @api_v1_category.name
    click_on "Create Category"

    assert_text "Category was successfully created"
    click_on "Back"
  end

  test "should update Category" do
    visit api_v1_category_url(@api_v1_category)
    click_on "Edit this category", match: :first

    fill_in "Name", with: @api_v1_category.name
    click_on "Update Category"

    assert_text "Category was successfully updated"
    click_on "Back"
  end

  test "should destroy Category" do
    visit api_v1_category_url(@api_v1_category)
    click_on "Destroy this category", match: :first

    assert_text "Category was successfully destroyed"
  end
end
