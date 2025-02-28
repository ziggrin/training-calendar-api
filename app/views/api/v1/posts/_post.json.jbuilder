json.extract! post, :id, :title, :date, :description, :image, :created_at, :updated_at
json.category do
  json.name api_v1_post.category.try(:name)
end
json.url post_url(post, format: :json)