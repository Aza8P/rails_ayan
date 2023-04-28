class User < ApplicationRecord
    has_many :trips
    has_many :travel_preferences
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
end
