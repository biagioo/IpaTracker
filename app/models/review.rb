class Review < ApplicationRecord
    belongs_to :user
    belongs_to :ipa
    validates :title, uniqueness: true
    validates :title, presence: true
    validates :content, length: {:minimum => 10}
end
