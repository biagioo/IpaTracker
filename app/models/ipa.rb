class Ipa < ApplicationRecord
    has_many :reviews, :dependent => :delete_all
    has_many :users, through: :reviews
    validates :name, :uniqueness => true, :length => {:minimum => 5}
    validates :name, presence: true

    scope :recent, -> { order(created_at: :desc) }
    

    # def self.search(name)
    #     # byebug
    #     if name
    #         ipa_find = Ipa.find_by(name: name)
    #         if ipa_find
    #             self.where(ipa_id: ipa_find)
    #         else 
                
    #             @ipas = Ipa.all 

    #         end
    #     else
    #         ipas = Ipa.all
    #     end
    # end

end
