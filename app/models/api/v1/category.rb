class Api::V1::Category < ApplicationRecord
    has_many :posts, dependent: :nullify  # or :destroy, depending on your needs
    validates :name, presence: true, uniqueness: true
end
