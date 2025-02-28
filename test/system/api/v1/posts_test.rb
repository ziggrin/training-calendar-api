require "application_system_test_case"

class Api::V1::PostsTest < ApplicationSystemTestCase
  setup do
    @api_v1_post = api_v1_posts(:one)
  end

  test "visiting the index" do
    visit api_v1_posts_url
    assert_selector "h1", text: "Posts"
  end

  test "should create post" do
    visit api_v1_posts_url
    click_on "New post"

    fill_in "Category", with: @api_v1_post.category_id
    fill_in "Date", with: @api_v1_post.date
    fill_in "Description", with: @api_v1_post.description
    fill_in "Duration", with: @api_v1_post.duration
    fill_in "Image", with: @api_v1_post.image
    fill_in "Title", with: @api_v1_post.title
    click_on "Create Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "should update Post" do
    visit api_v1_post_url(@api_v1_post)
    click_on "Edit this post", match: :first

    fill_in "Category", with: @api_v1_post.category_id
    fill_in "Date", with: @api_v1_post.date
    fill_in "Description", with: @api_v1_post.description
    fill_in "Duration", with: @api_v1_post.duration
    fill_in "Image", with: @api_v1_post.image
    fill_in "Title", with: @api_v1_post.title
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "should destroy Post" do
    visit api_v1_post_url(@api_v1_post)
    click_on "Destroy this post", match: :first

    assert_text "Post was successfully destroyed"
  end
end
