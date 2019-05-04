class User < ApplicationRecord

    # A user has a 1-to-many relationship with reviews, comments & bookmarks
    has_many :reviews, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :bookmarks, dependent: :destroy

    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, on: :create, presence: true, length: { minimum: 7 }
    validates :password_confirmation, on: :create, presence: true, length: { minimum: 7 }

    def to_param
      username
    end

end
