class Ipa < ApplicationRecord
    has_many :reviews, :dependent => :delete_all
    has_many :users, through: :reviews
    validates :name, :uniqueness => true, :length => {:minimum => 5}
    validates :name, presence: true

    scope :recent, -> { order(created_at: :desc) }
    

end
