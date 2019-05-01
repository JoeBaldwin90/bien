class Comment < ApplicationRecord

  # Comment belongsa to a review and a user
  belongs_to :review
  belongs_to :user

  validates :body, presence: true

  profanity_filter :body, :method => 'stars'
end
