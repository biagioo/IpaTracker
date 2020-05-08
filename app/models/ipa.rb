class Ipa < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    validates :name, uniqueness: true
    validates :name, presence: true
    validates :name, length: { is: 5 }

    scope :recent, -> { order(created_at: :desc) }
    

end
