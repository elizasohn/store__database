class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :content_body, presence: true
  validates :rating, presence: true
  validates :content_body, length: { in: 50..250 }
  validates :rating, numericality: { less_than_or_equal_to_5: true }
end
