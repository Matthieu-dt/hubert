class Category < ApplicationRecord
  belongs_to :user
  has_many :artworks, dependent: :destroy
  has_one_attached :photo

  validates :name, :subtitle, :description, :photo, presence: true
end
