class User < ApplicationRecord
    has_many :reviews
    has_many :ipas, through: :reviews
    has_secure_password
end
