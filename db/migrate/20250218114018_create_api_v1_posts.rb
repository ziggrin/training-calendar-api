class CreateApiV1Posts < ActiveRecord::Migration[8.0]
  def change
    create_table :api_v1_posts do |t|
      t.string :title
      t.date :date
      t.text :description
      t.string :image
      t.integer :duration
      t.integer :category_id

      t.timestamps
    end
  end
end
