class Book < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :title, :author, :description, :rating, :price, :image, presence: true
end
