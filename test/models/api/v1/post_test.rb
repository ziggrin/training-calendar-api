require "test_helper"

class Api::V1::PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should NOT create api_v1_post without values " do
    post = Api::V1::Post.new
    assert_not post.save, "Saved api_v1_post without values"
  end

  test "should create api_v1_post with title, duration, category_id " do
    category = Api::V1::Category.create!(name: "Test Category")
    post = Api::V1::Post.new(title: "Test-X", duration: 60, category_id: api_v1_categories(:one).id)
    assert post.save, "Did NOT saved api_v1_post with title, duration, category_id"
  end
end
