# This is the model which processes all of the data for our controller

class Review < ApplicationRecord

  validates :restaurant, presence: true
  validates :title, presence: true #this is a hash, also valid is { presence: true }
  validates :body, length: { minimum: 10 }
  validates :score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

end
