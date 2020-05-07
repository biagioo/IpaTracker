class Review < ApplicationRecord
    belongs_to :user
    belongs_to :ipa
    validates :title, uniqueness: true
    validates :title, presence: true
end
