class Artwork < ApplicationRecord
  belongs_to :category
  has_one_attached :photo

  validates :photo, presence: true
end
