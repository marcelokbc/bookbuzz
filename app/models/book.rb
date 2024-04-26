class Book < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, :author, :description, :rating, :price, presence: true
end
