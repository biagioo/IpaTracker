class User < ApplicationRecord
    has_many :reviews
    has_many :ipas, through: :reviews
    has_secure_password
    validates :email, :username, uniqueness: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end
