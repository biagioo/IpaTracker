class Ipa < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    validates :name, uniqueness: true
    validates :name, presence: true

    scope :recent, -> { order(:created_at, :desc) }

end
