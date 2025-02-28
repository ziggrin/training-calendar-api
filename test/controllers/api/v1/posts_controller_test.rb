require "test_helper"

class Api::V1::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_post = api_v1_posts(:one)
  end

  test "should get index" do
    get api_v1_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_post_url
    assert_response :success
  end

  test "should create api_v1_post" do
    file = fixture_file_upload('test_image.png', 'image/png')
    assert_difference("Api::V1::Post.count") do
      post api_v1_posts_url, params: { api_v1_post: { 
        category_id: api_v1_categories(:one).id,
        date: @api_v1_post.date,
        description: @api_v1_post.description,
        duration: @api_v1_post.duration,
        image_file: file,
        title: @api_v1_post.title
      } }, as: :multipart, headers: { "Accept" => "application/json" }
    end
  
    assert_response :created
  end
  

  test "should get edit" do
    get edit_api_v1_post_url(@api_v1_post)
    assert_response :success
  end

  test "should update api_v1_post" do
    file = fixture_file_upload('test_image.png', 'image/png')
    patch api_v1_post_url(@api_v1_post), params: { api_v1_post: { 
      category_id: api_v1_categories(:one).id,
      date: @api_v1_post.date, 
      description: @api_v1_post.description, 
      image_file: file, 
      title: @api_v1_post.title,
      duration: @api_v1_post.duration
    } }, as: :multipart, headers: { "Accept" => "application/json" }
    assert_response :success
  end  
  
  test "should destroy api_v1_post" do
    assert_difference("Api::V1::Post.count", -1) do
      delete api_v1_post_url(@api_v1_post)
    end

    assert_redirected_to api_v1_posts_url
  end
end
