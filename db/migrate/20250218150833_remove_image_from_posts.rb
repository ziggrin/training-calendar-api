class RemoveImageFromPosts < ActiveRecord::Migration[8.0]
  def change
    remove_column :api_v1_posts, :image, :string
  end
end
