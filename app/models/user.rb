class User < ApplicationRecord

    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 7 }
    validates :password_confirmation, presence: true, length: { minimum: 7 }


end
