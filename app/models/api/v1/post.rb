class Api::V1::Post < ApplicationRecord
  belongs_to :category
  has_one_attached :image_file

  validates :title, :category, presence: true
  validates :duration, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
end
