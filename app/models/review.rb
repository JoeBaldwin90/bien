# This is the model which processes all of the data for our controller

class Review < ApplicationRecord

  # Review has a 1-to-many relationship with comments
  has_many :comments

  # Review belongs to a single user
  belongs_to :user

  geocoded_by :address
  after_validation :geocode

  validates :restaurant, presence: true
  validates :title, presence: true #this is a hash, also valid is { presence: true }
  validates :body, length: { minimum: 10 }
  validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :address, presence: true

  def to_param
    id.to_s + "-" + title.parameterize #converts URL to readable string (SEO). Title is a method()
  end

end
