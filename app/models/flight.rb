class Flight < ApplicationRecord
  belongs_to :user
  validates :start_date, presence: true
  validates :destination, presence: true
  validates :origin, presence: true
end
