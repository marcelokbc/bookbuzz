class Book < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :title, :author, :description, :rating, :price, :image, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["author", "created_at", "description", "id", "id_value", "price", "rating", "title", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["comments", "image_attachment", "image_blob"]
  end
end
