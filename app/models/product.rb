class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  accepts_nested_attributes_for :reviews
  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true
  before_save(:titleize_product)

  scope :with_most_reviews, -> { order(reviews: :desc)}
  scope :most_recent, -> { order(created_at: :desc).limit(3)}

  private
  def titleize_product
    self.name = self.name.titleize
  end
end
