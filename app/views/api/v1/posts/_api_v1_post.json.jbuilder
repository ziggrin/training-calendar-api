json.extract! api_v1_post, :id, :title, :date, :description, :duration, :category_id, :created_at, :updated_at
json.category do
  json.name api_v1_post.category.try(:name)
end
json.image_url api_v1_post.image_file.attached? ? Rails.application.routes.url_helpers.rails_blob_url(api_v1_post.image_file) : nil
json.url api_v1_post_url(api_v1_post, format: :json)
