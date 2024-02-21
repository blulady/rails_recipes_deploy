class Review < ApplicationRecord
  validates :rating, presence: true

  belongs_to :recipe
  belongs_to :user
end
