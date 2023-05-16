class User < ApplicationRecord
    has_many :trips
    has_many :travel_preferences

    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
end
