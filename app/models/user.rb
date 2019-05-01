class User < ApplicationRecord

    # A user has a 1-to-many relationship with reviews, comments & bookmarks
    has_many :reviews
    has_many :comments
    has_many :bookmarks

    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 7 }
    validates :password_confirmation, presence: true, length: { minimum: 7 }

    def to_param
      username
    end

end
